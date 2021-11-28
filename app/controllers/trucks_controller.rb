class TrucksController < ApplicationController
  before_action :set_truck, only: %i[ show edit update destroy ]

  respond_to :js, :html, :json

  # GET /trucks or /trucks.json
  def index
    @trucks = Truck.all
    if(params[:search] && !params[:search].empty?)
    else
      if signed_in?
      @trucks = Truck.where("description LIKE ?", "%#{params[:search]}%").order(created_at: :desc)
    end
  end

    
  end

  # GET /trucks/1 or /trucks/1.json
  def show
  end

  # GET /trucks/new
  def new
    @truck = Truck.new
  end

  # GET /trucks/1/edit
  def edit
  end

  def like
    @truck = Truck.find(params[:id])
    puts "camion:#{@truck.inspect}}"
    if params[:format] == 'like'
      @truck.liked_by current_user
    elsif params[:format] == 'unlike'
      @truck.unliked_by current_user
    end
    redirect_to root_path
  end

  # POST /trucks or /trucks.json
  def create
    @truck = Truck.new(truck_params.except(:type_truck))
    @truck.type_truck = TypeTruck.create(name: params["truck"]["type_truck"])
    @truck.user_id = current_user.id

    respond_to do |format|
      if @truck.save
        format.html { redirect_to @truck, notice: "Truck was successfully created." }
        format.json { render :show, status: :created, location: @truck }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trucks/1 or /trucks/1.json
  def update
    @truck.user_id = current_user.id
    respond_to do |format|
      if @truck.update(truck_params.except(:type_truck))
        format.html { redirect_to @truck, notice: "Truck was successfully updated." }
        format.json { render :show, status: :ok, location: @truck }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trucks/1 or /trucks/1.json
  def destroy
    @truck.destroy
    respond_to do |format|
      format.html { redirect_to trucks_url, notice: "Truck was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck
      @truck = Truck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def truck_params
      params.require(:truck).permit(:picture, :description, :tonnage, :rate, :region, :commune, :type_truck)
    end
end
