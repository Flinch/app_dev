class PagesController < ApplicationController
	
	def start
		redirect_to articles_path if is_logged_in
	end

	def about
	end

	def signup
	end
	
end
