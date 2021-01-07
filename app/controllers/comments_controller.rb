class CommentsController < ApplicationController
	def show
	end

	def new
	end

	def create
		@article = Article.find(params[:id])
		@comment = @article.comments.new(comment_param)
		@comment.user_id = current_user.id
		
		if @comment.save
			flash[:notice] = "Comment saved successfully."
			redirect_to article_path(@article)
		else
			flash[:error] = "Comment saved successfully."
			redirect_to article_path(@article)
		end
		
	end

	private 

		def comment_param
			params.permit(:description)
		end
end