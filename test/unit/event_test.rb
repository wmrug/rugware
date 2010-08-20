require 'test_helper'

class EventTest < ActiveSupport::TestCase
  subject { Factory(:event) }
  should validate_uniqueness_of(:title)
  should validate_presence_of(:body)
  should validate_presence_of(:title)
  should validate_presence_of(:start_time)
  should validate_presence_of(:end_time)
end
