require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  
  EVENT_HASH = {:event => {:title => "Test123", 
                          :body => "some content", 
                          :start_time => Time.now,
                          :end_time => Time.now + Event::DEFAULT_MEETING_LENGTH}}
  
  context "with a set of pre-built events" do
    
    setup do
      5.times { Factory(:event) }
    end
  
    should "be able to see the events list page" do
      get :index
      assert_response :success
      assert assigns(:events)
    end
    
    should "be able to see a single event page" do
      event = Event.first
      get :show, {:id => event.id}
      assert_response :success
      assert assigns(:event)
    end
    
    context "when not logged in" do
      
      setup do
        @event = Event.first
      end
      
      should "not be able to visit the new event page" do
        get :new
        assert_response :redirect
        assert_redirected_to "/"
      end
      
      should "not be able to create a new event" do
        assert_no_difference "Event.count" do
          post :create, EVENT_HASH
        end
        assert_response :redirect
        assert_redirected_to "/"
      end
      
      should "not be able to visit edit event page" do
        get :edit, {:id => @event.id}
        assert_response :redirect
        assert_redirected_to "/"
      end
      
      should "not be able to update an event" do
        post :update, {:id => @event.id}.merge(EVENT_HASH)
        assert_response :redirect
        assert_redirected_to "/"
      end
      
      should "not be able to delete an event" do
        assert_no_difference "Event.count" do
          post :destroy, {:id => @event.id}
        end
        assert_response :redirect
        assert_redirected_to "/"
      end
      
    end
    
    context "when logged in as an admin" do
      
      setup do
        @event = Event.first
        @user = Factory(:user, :admin => true)
        sign_in @user
      end
      
      should "be able to visit the new event page" do
        get :new
        assert_response :success
      end
      
      should "be able to create a new event" do
        assert_difference "Event.count", 1 do
          post :create, EVENT_HASH
        end
        event = assigns(:event)
        assert event
        assert_redirected_to event_path(event)
      end
      
      should "be able to visit edit event page" do
        get :edit, {:id => @event.id}
        assert_response :success
      end
      
      should "be able to update an event" do
        post :update, {:id => @event.id}.merge(EVENT_HASH)
        @event.reload
        assert_response :redirect
        assert_equal assigns(:event).title, EVENT_HASH[:event][:title]
        assert_redirected_to event_path(@event)
      end
      
      should "be able to delete an event" do
        assert_difference "Event.count", -1 do
          post :destroy, {:id => @event.id}
        end
        assert_response :redirect
        assert_redirected_to events_path
      end

    end
    
  end
  
end
