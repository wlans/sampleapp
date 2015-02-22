require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end
    
  test "layout links logged in and logged out" do
  	get root_path
  	assert_template 'static_pages/home'
  	assert_select "a[href=?]", root_path, count: 2
  	assert_select "a[href=?]", help_path
  	assert_select "a[href=?]", about_path
  	assert_select "a[href=?]", contact_path
	assert_select "a[href=?]", signup_path
	get signup_path
	assert_select "title", full_title("Sign up")
  log_in_as(@user)
  get root_path
  assert_select "a[href=?]", users_path
  assert_select "a[href=?]", logout_path
  assert_select 'a', text: 'Settings', count: 1
  assert_select 'a', text: 'Profile', count: 1
	end
end

