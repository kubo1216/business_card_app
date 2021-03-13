require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    
  end
  
  test "layout links" do
    get root_path
    assert_select "a[href=?]", root_path, count:2
    assert_select "a[href=?]", static_pages_help_path
    # assert_select "a[href=?]", blog_path
  end
end
