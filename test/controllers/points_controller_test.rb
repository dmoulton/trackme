require "test_helper"

class PointsControllerTest < ActionController::TestCase

  def point
    @point ||= points :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:points)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    point
    assert_difference('Point.count') do
      post :create, {altitude: @point.altitude, bearing: @point.bearing, hdop: @point.hdop, lat: @point.lat, lon: @point.lon, profile_id: @point.profile_id, speed: @point.speed, timestamp: @point.timestamp.to_i, user_id: @point.user_id}
    end

    assert_response :success
  end

  def test_show
    get :show, id: point
    assert_response :success
  end

  def test_edit
    get :edit, id: point
    assert_response :success
  end

  # def test_update
  #   put :update, id: point, point: { altitude: @point.altitude, bearing: @point.bearing, hdop: @point.hdop, lat: @point.lat, lon: @point.lon, profile_id: @point.profile_id, speed: @point.speed, timestamp: @point.timestamp, user_id: @point.user_id }
  #   assert_redirected_to point_path(assigns(:point))
  # end

  def test_destroy
    assert_difference('Point.count', -1) do
      delete :destroy, id: point
    end

    assert_redirected_to points_path
  end
end
