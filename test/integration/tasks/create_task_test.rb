require 'test_helper'

class CreateTaskTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.new(name: "Food", description: "Test Food Category").save
  end

  test "should be able to create task on category show page" do
    @get_category = Category.first
    get category_path(@get_category.id)
    assert_response :success

    assert_difference 'Task.count', 1 do
      post category_tasks_path(@get_category.id), params: { task: { title: "Test Task", body: "Test Task Desc", status: "new", due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f)) } }
    end

    assert_response :redirect
  end
  
end