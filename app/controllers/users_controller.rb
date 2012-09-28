class UsersController < ApplicationController
  layout 'application'
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
      if @user.save
        render "show"
      else
        render "new"
      end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def show
      @user = User.find(params[:id])
  end

  def home
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to show_path(:id => @user.id)#"/show?id=#{@user.id}"
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def listskills
    @user = User.find_by_id(params[:id])
    @user.skills
  end

  def say_when
    @user = User.find_by_id(params[:id])
    @password = @user.password
     respond_to do |format|
        format.html
        format.js
    end
  end

  def index
    @users = User.all
    respond_to do |format|
    format.xml  {render xml: @users}
    end

  end


end
