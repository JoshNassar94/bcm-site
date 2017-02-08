require 'test_helper'

class AboutUsControllerTest < ActionDispatch::IntegrationTest
  test "should get our-team" do
    get about_us_our-team_url
    assert_response :success
  end

  test "should get our-mission" do
    get about_us_our-mission_url
    assert_response :success
  end

  test "should get faqs" do
    get about_us_faqs_url
    assert_response :success
  end

  test "should get social-media" do
    get about_us_social-media_url
    assert_response :success
  end

end
