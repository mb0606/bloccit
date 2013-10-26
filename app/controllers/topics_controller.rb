class TopicsController < ApplicationController


  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    authorize! :create, @topic, message: "You need to be an admin to do that."
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
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