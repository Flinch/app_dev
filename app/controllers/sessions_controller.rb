class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id 
			flash[:alert] = "Logged in successfully"
			redirect_to user
		else
			flash.now[:error] = "There was something wrong"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:alert] = 'You have been successfully logged out'
		redirect_to root_path
	end

end
