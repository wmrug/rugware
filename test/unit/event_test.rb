require 'test_helper'

class EventTest < ActiveSupport::TestCase
  subject { Factory(:event) }
  should validate_uniqueness_of(:title)
  should validate_presence_of(:body)
  should validate_presence_of(:title)
  should validate_presence_of(:start_time)
  should validate_presence_of(:end_time)
  
  should "not be able to create an event with a start_time > end_time" do
    assert_raises ActiveRecord::RecordInvalid do
      Factory(:event, :start_time => Time.now + 1.hour, :end_time => Time.now)
    end
  end
  
end
