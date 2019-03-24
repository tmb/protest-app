module ApplicationHelper
  include ActionView::Helpers
  def filterbar_blankslate(text, options = {})
    blankslate(text, 'data-behavior': 'filterbar_blankslate', class: 'mt2 mb2', **options)
  end

  def badge_for(count, options = {})
    content_tag :span, count, class: "badge #{options[:class]} #{'bg-muted' if count == 0}"
  end

  def status_badge(type = :pending)
    content_tag :span, '', class: "status bg-#{type}"
  end

  def status_if(type, condition)
    status_badge(type) if condition
  end

  def pop_icon_to(icon, url, options = {})
    link_to url, options.merge({ class: "pop #{options[:class]}" }) do
      inline_icon icon, size: options[:size] || 36
    end
  end

  def relative_timestamp(time, options = {})
    content_tag :span, "#{options[:prefix]}#{time_ago_in_words time} ago", options.merge({ title: time })
  end

  def auto_link_new_tab(text)
    auto_link(text, html: { target: '_blank' })
  end

  def debug_obj(object)
    content_tag :pre, pp(item.attributes.to_yaml)
  end

  def inline_icon(filename, options = {})
    file = File.read(Rails.root.join('app', 'assets', 'images', 'icons', "#{filename}.svg"))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    options[:style] ||= ''
    if options[:size]
      options[:width] = options[:size]
      options[:height] = options[:size]
      options.delete :size
    end
    options.each { |key, value| svg[key.to_s] = value }
    doc.to_html.html_safe
  end

  def filterbar_item(label, name, selected = false)
    content_tag :a, label, class: 'filterbar__item',
    tabindex: 0, role: 'tab', 'aria-selected': selected,
    data: { name: name.to_s, behavior: 'filterbar_item' }
  end

  def map_url(lat = 41.838796, lng = -83.200725, options = {})
    "https://dev.virtualearth.net/REST/v1/Imagery/Map/Aerial/#{lat},#{lng}/11/?mapSize=2000,1500&format=png&key=AssBchuxLMpaS6MmACdfDyLpD4X7_T2SZ34cC_KBcWlPU6iZCsWgv0tTbw5Coehm"
  end

  def page_md
    content_for(:container_class) { 'container--md' }
  end

  def page_sm
    content_for(:container_class) { 'container--sm' }
  end
  alias_method :page_narrow, :page_sm

  def page_xs
    content_for(:container_class) { 'container--xs' }
  end
  alias_method :page_extranarrow, :page_xs

  def title(text)
    content_for :title, text
  end
end
