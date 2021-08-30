require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "Food", description: "Test Food Category", user_id: users(:one).id)
    @user = User.new(email: "test@test.com", password: "test12345", password_confirmation: "test12345")
  end

  test "Should not be able to create user without email" do
    @user.email = ""
    assert_not @user.save, "Saved without filling up required details"
  end

  test "Should not be able to create duplicate user" do
    @user.save
    user_duplicate = User.new(email: "test@test.com", password: "test12345", password_confirmation: "test12345")
    assert_not user_duplicate.save, "Created duplicate user"
  end

end
