require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "名刺管理サービス"
  end
  
  test "should get root" do
    get root_path
    assert_response :success
  end
  
  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "ヘルプ | #{@base_title}"
  end

end
