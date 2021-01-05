class ApplicationController < ActionController::Base

	helper_method :current_user, :is_logged_in, :category_icon_select
	
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def is_logged_in
		!!current_user
	end

	def require_user
		if !is_logged_in
			flash[:alert] = "You need to be signed in to perform this action"
			redirect_to login_path
		end
	end

	def category_icon_select(category)

		if category == "Music"
			return "music"
		end

		if category == "Sports"
			return "sports"
		end

		if category == "Medicine"
			return "medicine"
		end

		if category == "Travel"
			return "travel" 
		end

		if category == "Food"
			return "food"
		end

	end



end
