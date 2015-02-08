require 'test_helper'

class SessionsHelperTest < ActionView::TestCase	

	def setup
		@user = users(:michael)
		remember(@user)
	end

	test "current_user returns right user when session is nil" do
		@user.update_attribute(:remember_digest, User.digest(User.new_token))
		assert_nil current_user
	end
end