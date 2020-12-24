require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

   def setup
   	@category = Category.create(name: "Sports")
   	@category1 = Category.create(name: "Travel")
   end

   test "should show category listings" do
   	get '/categories'
   	assert_select "a[href=?]", category_path(@category), text: @category.name
   	assert_select "a[href=?]", category_path(@category1), text: @category1.name
   end

end
