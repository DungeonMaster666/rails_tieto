class VacinsController < ApplicationController
  before_action :set_vacin, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /vacins or /vacins.json
  def index
    @vacins = Vacin.all
  end

  # GET /vacins/1 or /vacins/1.json
  def show
  end

  # GET /vacins/new
  def new
    #@vacin = Vacin.new
    @vacin = current_user.vacins.build
  end

  # GET /vacins/1/edit
  def edit
  end

  # POST /vacins or /vacins.json
  def create
    # @vacin = Vacin.new(vacin_params)
    @vacin = current_user.vacins.build(vacin_params)
    respond_to do |format|
      if @vacin.save
        format.html { redirect_to @vacin, notice: "Vacin was successfully created." }
        format.json { render :show, status: :created, location: @vacin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vacin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacins/1 or /vacins/1.json
  def update
    respond_to do |format|
      if @vacin.update(vacin_params)
        format.html { redirect_to @vacin, notice: "Vacin was successfully updated." }
        format.json { render :show, status: :ok, location: @vacin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vacin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacins/1 or /vacins/1.json
  def destroy
    @vacin.destroy
    respond_to do |format|
      format.html { redirect_to vacins_url, notice: "Vacin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @vacin = current_user.vacins.find_by(id: params[:id])
    redirect_to vacins_path, notice: "Not Authorized to Edit" if @vacin.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacin
      @vacin = Vacin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacin_params
      params.require(:vacin).permit(:iest_kods, :iest_nos, :vacin_date, :vacin_type, :preparat, :vacin_posms, :vacin_kartas_num, :prep_daudz, :vakcin_ievade, :indik_vakcin, :pers_age, :pers_dzimums, :pers_skaits, :user_id)
    end
end
