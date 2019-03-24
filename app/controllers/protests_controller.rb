class ProtestsController < ApplicationController
  before_action :set_protest, only: [:show, :edit, :update, :destroy]
  before_action :set_protest_id, only: [:rsvp, :admin, :notify]

  # GET /protests
  # GET /protests.json
  def index
    @protests = Protest.all
  end

  # GET /protests/1
  # GET /protests/1.json
  def show
    @rsvp_person = @protest.rsvp_people.new

    respond_to do |format|
      format.html
      format.pdf do
        send_data @protest.generate_pdf.render
      end
    end
  end

  # GET /protests/new
  def new
    @protest = Protest.new
  end

  # GET /protests/1/edit
  def edit
  end

  # POST /protests
  # POST /protests.json
  def create
    @protest = Protest.new(protest_params)

    respond_to do |format|
      if @protest.save
        format.html { redirect_to @protest, notice: 'Protest was successfully created.' }
        format.json { render :show, status: :created, location: @protest }
      else
        format.html { render :new }
        format.json { render json: @protest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /protests/1
  # PATCH/PUT /protests/1.json
  def update
    respond_to do |format|
      if @protest.update(protest_params)
        format.html { redirect_to @protest, notice: 'Protest was successfully updated.' }
        format.json { render :show, status: :ok, location: @protest }
      else
        format.html { render :edit }
        format.json { render json: @protest.errors, status: :unprocessable_entity }
      end
    end
  end

  def rsvp
    if @protest.rsvp_people.create(rsvp_params)
      redirect_to @protest, notice: "You've successfully RSVP'd for #{@protest.name}!"
    else
      render :show
    end
  end

  def notify
    SendTwilioMessagesJob.perform_now(@protest.rsvp_people.pluck(:phone_number), params[:message])
    flash[:success] = "Message sent to #{@protest.rsvp_people.count} protesters!"
    redirect_to protest_admin_path(@protest)
  end

  def admin
  end

  def image_upload
    @protest = Protest.find_by_image_key(params[:key])
    redirect_to protests_path, notice: "Invalid key!" unless @protest
  end

  def upload
    @protest = Protest.find_by_image_key(params[:key])
    redirect_to protests_path, notice: "Invalid key!" unless @protest
    if @protest.update(image_upload_params)
      flash[:success] = "Your image(s) have been uploaded!"
      redirect_to protests_path
    else
      redirect_to protests_path
    end
  end


  # DELETE /protests/1
  # DELETE /protests/1.json
  def destroy
    @protest.destroy
    respond_to do |format|
      format.html { redirect_to protests_url, notice: 'Protest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_protest
      @protest = Protest.find(params[:id])
    end

    def set_protest_id
      @protest = Protest.find(params[:protest_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def protest_params
      params.require(:protest).permit(:name, :location, :description, :start, :end, :what_to_bring, :organizer_id)
    end

    def rsvp_params
      params.require(:rsvp_person).permit(:name, :email, :phone_number)
    end

    def image_upload_params
      params.require(:protest).permit(images: [])
    end
end
