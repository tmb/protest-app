class ProtestsController < ApplicationController
  before_action :set_protest, only: [:show, :edit, :update, :destroy]

  # GET /protests
  # GET /protests.json
  def index
    @protests = Protest.all
  end

  # GET /protests/1
  # GET /protests/1.json
  def show
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def protest_params
      params.require(:protest).permit(:name, :location, :description, :what_to_bring, :organizer_id)
    end
end
