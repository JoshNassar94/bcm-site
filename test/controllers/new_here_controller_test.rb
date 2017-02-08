require 'test_helper'

class NewHereControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get new_here_index_url
    assert_response :success
  end

end
