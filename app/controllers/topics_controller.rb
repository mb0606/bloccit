class TopicsController < ApplicationController


  def index
    @topics = Topic.visible_to(current_user).paginate(page: params[:page], per_page: 10)##@topics = Topic.all
  end

  def new
    @topic = Topic.new
    authorize! :create, @topic, message: "You need to be an admin to do that."
  end

  def show
    @topic = Topic.find(params[:id])
    authorize! :read, @topic, message: "You need to be signed-in to do that."
    @posts = @topic.posts.includes(:user).includes(:comments).paginate(page: params[:page], per_page: 10)
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize! :update, @topic, message: "You need to be an admin to do that."
  end

  def create
    @topic = Topic.new(params[:topic])
    if @topic.save
      flash[:notice] = "Topic was saved successfully."
      redirect_to @topic#, :notice = "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new  
    end
  end

  def update
    @topic = Topic.find[params[:id]]
    authorize! :update, @topic, message: "You need to be an admin to do that."
    if @topic.update_attributes(params[:topic])
      redirect_to @topic
    else
      flash[:error] = "Error saving topic. Please try again"
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    name = @topic.name
    authorize! :destroy, @topic, message: "You need to own the topic to delete it."
    if @topic.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end

end

# update_attribute method *****************
# def update_attribute(name, value)
#  name = name.to_s
#  verify_readonly_attribute(name)
#  send("#{name}=", value)
#  save(validate: false)
#end
# Diff between redirect_to and render *************************
#> 1) redirect_to :action => 'list'
#
#This causes an HTTP redirect to be returned to the browser,
#which then fetches the new URL.
#
#> 2) render :action => 'list'
#
#This causes a 'server side' redirect, and causes
#the other action to be executed without the browser
#knowing anything about the change.

# FLASH **********************************************************
#The flash hash is what Rails uses to display messages
# (both notices and errors). 
#Since it's a Hash, you can assign any key/value pair that you want