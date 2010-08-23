require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  context "when there are a mix of admins and non-admins present" do
    setup do
      3.times { Factory(:user) }
      2.times { Factory(:user, :admin => true) }
      @admin_user = User.where(:admin => true).first
      @user = User.where(:admin => false).first
    end
    
    should "be able to see the list page" do
      get :index
      assert_response :success
    end
    
    should "not be able to see the profile page" do
      get :profile
      assert_response :redirect
      assert_redirected_to new_user_session_path
    end
    
    context "when logged in as a non-admin user" do
      
      setup do
        sign_in @user
      end
      
      should "be able to go to profile page" do
        get :profile, {:id => @user.id}
        assert_response :success
      end
      
      should "not be able to set self as an admin" do
        post :make_admin, {:id => @user.id, :user => {:admin => "1"}}
        assert_response :redirect
        assert_redirected_to "/"
        @user.reload
        assert_equal @user.admin, false
      end
      
    end
    
    context "when logged in as an admin user" do
      
      setup do
        sign_in @admin_user
      end
      
      should "be able to set user as an admin" do
        post :make_admin, {:id => @user.id, :user => {:admin => "1"}}
        assert_response :redirect
        assert_redirected_to user_path(@user)
        @user.reload
        assert_equal @user.admin, true
      end
      
    end
    
  end
  
end
