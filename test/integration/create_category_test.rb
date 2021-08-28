require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

  test "should be able to create category on index page" do
    get categories_path

    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "Test Category", description: "Test Desc" } }
    end

    assert_response :redirect
  end
  
end