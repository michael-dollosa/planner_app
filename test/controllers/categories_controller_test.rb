require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest 
  
  #initial routes testing
  test "Testing for route:index" do
    assert_routing categories_path, controller: 'categories', action: 'index'
  end

  test "Testing for route:new" do
    assert_routing new_category_path, controller: 'categories', action: 'new'
  end

  test "Testing for route:create" do
    assert_routing( { method: 'post', path: categories_path}, { controller: 'categories', action: 'create' })
  end

  test "Testing for route:show" do
    assert_routing category_path(1), controller: 'categories', action: 'show', id: "1"
  end

  test "Testing for route:edit" do
    assert_routing( { method: 'get', path: edit_category_path(1)}, { controller: 'categories', action: 'edit', id: "1" })
  end

  test "Testing for route:update" do
    assert_routing( { method: 'put', path: category_path(1)}, { controller: 'categories', action: 'update', id: "1" })
  end

  test "Testing for route:delete" do
    assert_routing( { method: 'delete', path: category_path(1)}, { controller: 'categories', action: 'destroy', id: "1" })
  end

  #controller data test
  test "Action:Index should show all Categories" do
    get categories_path
    assert_response :success
  end

  test "Action:New should render category new page" do
    get new_category_path
    assert_response :success
  end

  test "Action:Create should be able to create new category" do
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "Test Category", description: "Test Desc" } }
    end
  end

  test "Action:Update should be able to update specific category" do
    category = Category.new(name: "Food", description: "Test Food Category")
    category.save
    assert category.save

    new_category_name = "Updated Name"
    new_category_desc = "Updated Body"
    
    put category_path(category), params: { category: { name: new_category_name, description: new_category_desc } }

    assert_equal new_category_name.downcase, Category.find(category.id).name.downcase
    assert_equal new_category_desc, Category.find(category.id).description
  end

  test "Action:Delete should be able to create new category" do
    category = Category.new(name: "Food", description: "Test Food Category")
    category.save
    assert category.save

    assert_difference 'Category.count', -1 do
      delete category_path(category.id)
      assert_response :success
    end
  end



end
