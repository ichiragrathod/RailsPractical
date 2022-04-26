class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show update destroy ]

  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  def comment_search
    @comment = Comment.find_by(comment_content:params[:comment])
    if @comment
      render json: @comment
    else
      render json: "Record not found!"
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:comment_content, :date_of_comment, :article_id)
    end
end
