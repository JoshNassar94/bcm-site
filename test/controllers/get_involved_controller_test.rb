require 'test_helper'

class GetInvolvedControllerTest < ActionDispatch::IntegrationTest
  test "should get upcoming-events" do
    get get_involved_upcoming-events_url
    assert_response :success
  end

  test "should get weekly-gatherings" do
    get get_involved_weekly-gatherings_url
    assert_response :success
  end

  test "should get small-groups" do
    get get_involved_small-groups_url
    assert_response :success
  end

end
