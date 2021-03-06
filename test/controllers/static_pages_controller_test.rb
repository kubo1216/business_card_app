require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "名刺管理サービス"
  end
  
  test "should get root" do
    get root_path
    assert_response :success
  end
  
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "ホーム | #{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "ヘルプ | #{@base_title}"
  end

end
