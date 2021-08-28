require 'test_helper'

class DeleteCategoryTest < ActionDispatch::IntegrationTest

  test "should be able to delete category on index page" do
    #go to index page
    get categories_path
    assert_response :success
    
    category = Category.new(name: "Food", description: "Test Food Category")
    category.save
    assert category.save

    assert_difference 'Category.count', -1 do
      delete category_path(category.id)
    end

    assert_response :redirect
  end
  
end