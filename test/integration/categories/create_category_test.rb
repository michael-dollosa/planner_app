require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  def setup
    Category.delete_all
    Task.delete_all
    sign_in users(:one)
    @category = Category.new(name: "Food 3", description: "Test Food Category", user_id: users(:one).id)
    @category.save
    @task = Category.find(@category.id).tasks.new(user_id: users(:one).id, title: "Task under Food", body: "Food Body", status: "new", due_date: Time.at(0.0 + rand(1..1.1) * (Time.now.to_f - 0.0.to_f)))
    @task.save
    
  end

  test "should be able to create category on index page" do
    get categories_path
    assert_response :success

    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "Test Category", description: "Test Desc" } }
    end
    assert_response :redirect
    
  end
  
end