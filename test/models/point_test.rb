require "test_helper"

class PointTest < ActiveSupport::TestCase

  def point
    @point ||= Point.new
  end

  def test_valid
    assert point.valid?
  end

end
