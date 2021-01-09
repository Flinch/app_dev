class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :update]

	def show
		@comments = Comment.all 
	end

	def index
		@articles = Article.paginate(page: params[:page], per_page: 3)
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_param)
		@article.user = current_user
		if @article.save
			flash[:notice] = "Note was created successfully."
			redirect_to current_user
		else
			render "new"
		end
	end

	def edit
	end

	def update
		if @article.update(article_param)
			flash[:notice] = "Note was updated successfully"
			redirect_to @article
		else
			render "edit"
		end

	end 

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to @article
	end

	private

		def set_article
			@article = Article.find(params[:id]) 
		end

		def article_param
			params.require(:article).permit(:title, :description, category_ids:[])
		end

		def require_same_user
			if (current_user != @article.user) && !(current_user.admin?)
				flash[:alert] = "You need to be logged in to your own profile to perform this action"
				redirect_to @article
			end
		end

end
