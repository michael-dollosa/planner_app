require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @category = Category.new(name: "Food", description: "Test Food Category")
  end

  test "Should not be able to create category without name and title" do
    @category.name = ""
    assert_not @category.save, "Saved without filling up required details"
  end

  test "Should not be able to create duplicate category" do
    @category.name = "TEst"
    @category.save
    category_duplicate = Category.new(name: "Test", description: "test desc")
    assert_not category_duplicate.save, "Created duplicate category"
  end

  test "Should not be able to create unique category" do
    @category.save
    category_duplicate = Category.new(name: "T3st", description: "test desc")
    assert category_duplicate.save, "Was not able to create unique category"
  end

end
