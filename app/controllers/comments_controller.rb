class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @comments = Comment.all
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = Comment.new(comment_params.merge(movie_id: params[:movie_id]))
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Successfully created a comment"
      redirect_to @movie
    else
      render 'movies/show'
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully deleted a comment"
    redirect_to movie_path(@movie)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :movie_id, :user_id)
  end
end
