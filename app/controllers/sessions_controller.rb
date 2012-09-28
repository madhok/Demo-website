class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.password_matches?(params[:session][:password])
      sign_in @user
      redirect_to @user
    else
       render 'new'
    end
  end

  def employercreate
     @employer = Employer.find_by_email(params[:session][:email])
    if @employer && @employer.password_matches?(params[:session][:password])
      #sign_in @employer
      redirect_to @employer #'employers/show'
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'employersignin'
    end
  end

  def destroy
  end

end
