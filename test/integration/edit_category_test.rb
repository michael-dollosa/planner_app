require 'test_helper'

class EditCategoryTest < ActionDispatch::IntegrationTest

  test "should be able to edit category on index page" do
    #go to index page
    get categories_path
    assert_response :success
    
    #create category to be edited for testing
    category = Category.new(name: "Food", description: "Test Food Category")
    category.save
    assert category.save

    #variable to compare edited params
    new_category_name = "Updated Name"
    new_category_desc = "Updated Body"
    
    put category_path(category), params: { category: { name: new_category_name, description: new_category_desc } }

    assert_equal new_category_name.downcase, Category.find(category.id).name.downcase
    assert_equal new_category_desc, Category.find(category.id).description

    assert_response :redirect
  end
  
end