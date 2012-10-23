require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test "should get launcher" do
    get :launcher
    assert_response :success
  end

end
