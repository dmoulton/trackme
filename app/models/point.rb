class Point < ActiveRecord::Base
  alias_attribute :lng, :lon
end
