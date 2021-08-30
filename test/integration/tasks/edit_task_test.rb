require 'test_helper'

class EditTaskTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:one)
    @category = Category.new(name: "Foodasdasdasd198", description: "Test Food Category", user_id: users(:one).id)
    @category.save
  end

  test "should be able to edit task on category show page" do
    get category_path(@category.id)
    assert_response :success

    #create task
    @category.tasks.new(user_id: users(:one).id, title: "Task under Food", body: "Food Body", status: "new", due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f))).save
    new_task_title = "Updated Title"
    new_task_body = "Updated Body"

    put category_task_path(category_id: @category.id, id: @category.tasks.first), params: { task: { title: new_task_title, body: new_task_body } }

    assert_equal new_task_title, @category.tasks.first.title
    assert_equal new_task_body, @category.tasks.first.body

    assert_response :redirect
  end
  
end