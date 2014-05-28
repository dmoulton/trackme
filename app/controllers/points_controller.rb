class PointsController < ApplicationController
  before_action :set_point, only: [:show, :edit, :update, :destroy]

  # GET /points
  # GET /points.json
  def index
    if params[:start_time] && params[:end_time]
      s = params[:start_time]
      e = params[:end_time]
      @points = Point.where("timestamp > to_timestamp(?) AND timestamp < to_timestamp(?)",s,e)
    else
      @points = Point.all
    end

    @highlat = -91
    @lowlat = 91
    @highlng = -181
    @lowlng = 181
    @points.each do |point|
      @highlat = point.lat if point.lat > @highlat
      @lowlat = point.lat if point.lat < @lowlat
      @highlng = point.lng if point.lng > @highlng
      @lowlng = point.lng if point.lng < @lowlng
    end
  end

  # GET /points/1
  # GET /points/1.json
  def show
  end

  # GET /points/new
  def new
    @point = Point.new
  end

  # GET /points/1/edit
  def edit
  end

  # POST /points
  # POST /points.json
  def create
    p = point_params
    p[:timestamp] = Time.at(p[:timestamp].to_i/1000).utc
    @point = Point.new(p)

    respond_to do |format|
      if @point.save
        format.html { render :create }
        format.json { render :show, status: :created, location: @point }
      else
        format.html { render :new }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /points/1
  # PATCH/PUT /points/1.json
  def update
    respond_to do |format|
      if @point.update(point_params)
        format.html { redirect_to @point, notice: 'Point was successfully updated.' }
        format.json { render :show, status: :ok, location: @point }
      else
        format.html { render :edit }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1
  # DELETE /points/1.json
  def destroy
    @point.destroy
    respond_to do |format|
      format.html { redirect_to points_url, notice: 'Point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point
      @point = Point.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def point_params
      params.permit(:lat, :lon, :timestamp, :hdop, :altitude, :speed, :bearing, :profile_id, :user_id)
    end
end
