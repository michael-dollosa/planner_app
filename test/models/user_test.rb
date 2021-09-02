require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "test@test.com", password: "test12345", password_confirmation: "test12345")
  end

  test "Should not be able to create user without email" do
    @user = User.new(email: "test5@test.com", password: "test12345", password_confirmation: "test12345", username: "test user 5")
    @user.email = ""
    assert_not @user.save, "Saved without filling up required details"
  end

  test "Should not be able to create user without username" do
    @user = @user = User.new(email: "test5@test.com", password: "test12345", password_confirmation: "test12345")
    @user.username = ""
    assert_not @user.save, "Saved without filling up required details"
  end

  test "Should not be able to create duplicate user" do
    @user = User.new(email: "test4@test.com", password: "test12345", username: "test user 4", password_confirmation: "test12345")
    @user.save
    user_duplicate = User.new(email: "test4@test.com", password: "test12345", username: "test user 4", password_confirmation: "test12345")
    user_duplicate.save
    assert_not user_duplicate.save, "Created duplicate user"
  end

end
