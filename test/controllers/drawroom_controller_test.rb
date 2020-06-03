require 'test_helper'

class DrawroomControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get drawroom_index_url
    assert_response :success
  end

end
