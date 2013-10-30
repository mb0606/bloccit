class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:topic_id])
    @comment= Comment.new 
    authorize! :create, Comment, message: "You need to be a member to create a new comment."
  end

  def edit
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(params[:comment])
    @comment.post = @comment
    # finds topic - @post is a new post associated to current_user-
    # @post.topic = put topic_id in the column of the posts table 


    authorize! :create, @comment, message: "You need to be signed up to do that."
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    authorize! :delete, @post, message: "You need to own the post to edit it."
  end
end

