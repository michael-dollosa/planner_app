require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    sign_in users(:one)
    @category = Category.new(name: "F1231264", description: "Test Food Category", user_id: users(:one).id)
    @category.save
    @task = @category.tasks.new(title: "Task Name", body: "Food Body", user_id: users(:one).id)
    @task.save
  end

  test "Should not be able to create task without title and body" do
    assert_not @task.save, "Saved without filling up required details"
  end

  test "Should be able to create task under a category" do
    @category.save
    find_category = Category.first
    check_if_created = find_category.tasks.new(user_id: users(:one).id, title: "Task under Food", body: "Food Body", status: "new", due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))).save
    assert check_if_created, "Not able to save under category"
  end

  test "Should be not be able to create incomplete task under a category" do
    @category.save
    find_category = Category.first
    check_if_created = find_category.tasks.new(body: "Food Body").save
    assert_not check_if_created, "Was able to save with incomplete task data"
  end
end
