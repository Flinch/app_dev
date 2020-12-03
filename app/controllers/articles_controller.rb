class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]

	def show
	end

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_param)
		if @article.save
			flash[:notice] = "Article was created successfully."
			redirect_to @article
		else
			render "new"
		end
	end

	def edit
	end

	def update
		if @article.update(article_param)
			flash[:notice] = "Article was updated successfully"
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
			params.require(:article).permit(:title, :description)
		end
end
