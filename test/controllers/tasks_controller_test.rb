require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
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


  

end
