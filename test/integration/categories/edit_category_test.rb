require 'test_helper'

class EditCategoryTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:one)
  end
  test "should be able to edit category on show page" do
    category = Category.new(name: "Food68787", description: "Test Food Category", user_id: users(:one).id)
    category.save
    assert category.save

    get category_path(category.id)
    assert_response :success

    new_category_name = "Updated Name"
    new_category_desc = "Updated Body"
    
    put category_path(category), params: { category: { name: new_category_name, description: new_category_desc, user_id: users(:one).id } }

    assert_equal new_category_name.downcase, Category.find(category.id).name.downcase
    assert_equal new_category_desc, Category.find(category.id).description
    
  end
  
end