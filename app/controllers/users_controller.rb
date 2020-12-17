class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show, :destroy]
	before_action :require_user, only: [:edit, :update]
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def index
		@users = User.paginate(page: params[:page], per_page: 3)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_param)
		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "Welcome to the site #{@user.username}."
			redirect_to articles_path
		else
			render "new"
		end
	end 

	def edit
	end

	def update
		if @user.update(user_param)
			flash[:notice] = "Your changes were saved"
			redirect_to @user
		else
			render "edit"
		end
	end

	def show
		@articles = @user.articles.paginate(page: params[:page], per_page: 3)
	end

	def login
	end

	def destroy
		@user.destroy
		if !(current_user.admin?)
			session[:user_id] = nil 
		end
		flash[:notice] = "All information associated with the user has been deleted"
		redirect_to articles_path
	end

	

	private

		def set_user
			@user = User.find(params[:id]) 
		end

		def user_param
			params.require(:user).permit(:username, :email, :password)
		end

		def require_same_user
			if current_user != @user && !(current_user.admin?)
				flash[:alert] = "You need to be logged in to your own profile to perform this action"
				redirect_to @user
			end
		end


end
