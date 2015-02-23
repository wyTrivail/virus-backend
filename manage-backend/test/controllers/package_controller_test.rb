require 'test_helper'

class PackageControllerTest < ActionController::TestCase
  test "should get get_by_version" do
    get :get_by_version
    assert_response :success
  end

end
