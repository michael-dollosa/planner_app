require 'test_helper'

class DeleteTaskTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:one)
    @category = Category.new(name: "Foodqweqweqweq123", description: "Test Food Category", user_id: users(:one).id)
    @category.save
    #create task
    @category.tasks.new(user_id: users(:one).id, title: "Task under Food", body: "Food Body", status: "new", due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))).save

  end

  test "should be able to delete task on category show page" do
    get category_path(@category.id)
    assert_response :success

    assert_difference 'Task.count', -1 do
      delete category_task_path(category_id: @category.id, id: @category.tasks.first)
    end

    assert_response :redirect
  end
  
end