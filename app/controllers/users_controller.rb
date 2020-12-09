class UsersController < ApplicationController
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

	private

		def set_user
			@user = User.find(params[:id]) 
		end

		def user_param
			params.require(:user).permit(:username, :email, :password)
		end


end
