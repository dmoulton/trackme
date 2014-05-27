require "test_helper"

class TrackingControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

end
