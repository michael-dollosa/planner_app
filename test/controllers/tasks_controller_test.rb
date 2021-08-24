require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.new(name: "Food", description: "Test Food Category")
  end
  #initial routes testing
  test "Testing for route:create" do
    assert_routing({ method: 'post', path: category_tasks_path(category_id: 1) }, { controller: 'tasks', action: 'create', category_id: "1" })
  end

  test "Testing for route:show" do
    assert_routing({ method: 'get', path: category_task_path(category_id: 1, id: 1) }, { controller: 'tasks', action: 'show', category_id: "1", id: "1" })
  end

  test "Testing for route:edit" do
    assert_routing({ method: 'get', path: edit_category_task_path(category_id: 1, id: 1) }, { controller: 'tasks', action: 'edit', category_id: "1", id: "1" })
  end

  test "Testing for route:update" do
    assert_routing({ method: 'put', path: category_task_path(category_id: 1, id: 1) }, { controller: 'tasks', action: 'update', category_id: "1", id: "1" })
  end

  #controller testing

  test "Action:Create should be able to create new task" do
    #create category first
    @category.save

    assert_difference 'Task.count', 1 do
      post category_tasks_path(@category.id), params: { task: { title: "Test Task", body: "Test Task Desc" } }
    end

    assert_response :success
  end 

  test "Action:Show should be able to show task" do
    #create task
    @category.tasks.new(title: "Task under Food", body: "Food Body").save
    get category_task_path(category_id: @category.id, id: @category.tasks.first)
    assert_response :success
  end

  test "Action:Update should be able to update task" do
    #create task
    @category.tasks.new(title: "Task under Food", body: "Food Body").save
    new_task_title = "Updated Title"
    new_task_body = "Updated Body"

    put category_task_path(category_id: @category.id, id: @category.tasks.first), params: { task: { title: new_task_title, body: new_task_body } }

    assert_equal new_task_title, @category.tasks.first.title
    assert_equal new_task_body, @category.tasks.first.body
    
  end

  test "Action:Delete should be able to update task" do
    #create task
    @category.tasks.new(title: "Task under Food", body: "Food Body").save

    assert_difference 'Task.count', -1 do
      delete category_task_path(category_id: @category.id, id: @category.tasks.first)
      assert_response :success
    end
  end

end
