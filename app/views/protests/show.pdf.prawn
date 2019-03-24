red = 'ff1500'
blue = '0069ff'
white = 'ffffff'
black = '000000'

font_families.update('GTAmerica' => {
  normal: Rails.root.join('lib/assets/pdf_fonts/GT-America-Regular.ttf').to_s,
  condensed: Rails.root.join('lib/assets/pdf_fonts/GT-America-Condensed-Bold.ttf').to_s,
  extended: Rails.root.join('lib/assets/pdf_fonts/GT-America-Extended-Black.ttf').to_s
})

font 'GTAmerica'
fallback_fonts ['Times-Roman']

canvas do
	fill_color blue
	fill_rectangle [bounds.left, bounds.top], bounds.right, 72
end

move_down 8
text @protest.location, size: 20, color: white, style: :condensed

move_down 64
text @protest.name, color: red, style: :extended, size: 48

move_down 16
text event_time_plain(@protest), color: blue, size: 24

move_down 16
text @protest.description, color: black, size: 20

if @protest.what_to_bring.present?
	move_down 24
	text "What to bring", size: 20, style: :condensed, color: black
	@protest.what_to_bring.lines.map do |line|
		move_down 4
		text "• line", size: 16, color: black
	end
end

move_down 16
