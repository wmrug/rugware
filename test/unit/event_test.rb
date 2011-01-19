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
  
  context "with a text with a large body " do
    
    setup do 
      long_text = Array.new(300, "A long piece of text").join(", ")
      @event = Factory(:event, :start_time => Time.now, :end_time => Time.now + 1.hour, :body => long_text)
    end
    
    should "have not be able to have a summary that is longer than 300 characters" do
      assert @event.summary.length < 301
    end
    
  end
  
  context "with a text with html sourced body" do
    setup do 
      long_text = Array.new(300, "<p>A long piece of text</p>").join(", ")
      @event = Factory(:event, :start_time => Time.now, :end_time => Time.now + 1.hour, :body => long_text)
      long_paragraph_text = Array.new(300, "A long piece of text").join(", ")
      @long_event = Factory(:event, :start_time => Time.now, :end_time => Time.now + 1.hour, :body => "<p>#{long_text}</p>")
    end
    
    should "not show more than the first paragraph" do
      assert @event.summary.count("<p>") == 1
    end
    
    should "have not be able to have a summary of the first paragraph that is longer than 300 characters" do
      assert @long_event.summary.length < 301
    end
    
  end
  
end
