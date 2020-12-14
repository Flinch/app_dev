module ApplicationHelper
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def is_logged_in
		!!current_user
	end
end
