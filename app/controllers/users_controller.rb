class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show]

	def index
		@users = User.paginate(page: params[:page], per_page: 3)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_param)
		if @user.save
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
	

	private

		def set_user
			@user = User.find(params[:id]) 
		end

		def user_param
			params.require(:user).permit(:username, :email, :password)
		end


end
