require "test_helper"

class PointsRouteTest < ActionDispatch::IntegrationTest
  def test_create
    assert_generates '/add_point', :controller => "points", :action => "create"
  end
end
