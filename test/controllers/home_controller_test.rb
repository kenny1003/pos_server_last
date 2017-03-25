require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get indxe" do
    get :indxe
    assert_response :success
  end

end
