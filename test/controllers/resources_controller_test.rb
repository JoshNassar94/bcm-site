require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  test "should get newsletter" do
    get resources_newsletter_url
    assert_response :success
  end

  test "should get sermon-notes" do
    get resources_sermon-notes_url
    assert_response :success
  end

  test "should get testimonies" do
    get resources_testimonies_url
    assert_response :success
  end

  test "should get leadership-app" do
    get resources_leadership-app_url
    assert_response :success
  end

end
