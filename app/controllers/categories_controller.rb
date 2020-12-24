class CategoriesController < ApplicationController 
	before_action :set_category, only: [:show, :edit, :update]
	#before_action :require_user, :require_admin, except: [:index, :show]

	def show
	end

	def index
		@categories = Category.paginate(page: params[:page], per_page: 3)
	end

	def new
		@category = Category.new()
	end  

	def create 
		@category = Category.new(categories_params)
		if @category.save
			flash[:notice] = "Category successfully created"
			redirect_to @category
		else
			render 'new'
		end

	end

	private

	def categories_params
		params.require(:category).permit(:name)
	end

	def set_category
		@category = Category.find(params[:id])
	end

	def require_admin
		if !current_user.admin? 
			flash[:error] = "You need to have admin access to do this"
			redirect_to current_user
		end 
	end

end 