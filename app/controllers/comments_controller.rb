class CommentsController < ApplicationController
	before_action :require_same_user, only: [:delete]
	before_action :require_user, only: [:create]

	def show
	end

	def new
	end

	def index
		@comments = Comment.all 
	end

	def destroy
      @comment = Comment.find(params[:id])
      @article = Article.find(@comment.article_id)
      @comment.destroy
      redirect_to article_path(@article)
	end


	def create
		@article = Article.find(params[:id])
		@comment = @article.comments.new(comment_param)
		@comment.user_id = current_user.id
		
		if @comment.save
			flash[:notice] = "Comment saved successfully."
			redirect_to article_path(@article)
		else
			flash[:error] = "Error saving comment"
			redirect_to article_path(@article)
		end
	end

	private 

		def comment_param
			params.permit(:description)
		end

		def require_same_user
			if (current_user.id != @comment.user_id) && !(current_user.admin?)
				flash[:alert] = "You need to be logged in to your own profile to perform this action"
				redirect_to @article
			end
		end
end