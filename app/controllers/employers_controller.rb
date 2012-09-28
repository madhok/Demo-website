class EmployersController < ApplicationController



  def new
    @employer = Employer.new

  end
  def show
    @employer = Employer.find(params[:id])


  end

  def create
    @employer = Employer.new(params[:employer])
    if @employer.save
       render 'show'
      else
      render 'new'
    end
  end

  def home

  end
  def add_as_interviewee
    @employer = Employer.find(params[:id])
    @user = User.find(params[:userid])
    @user.employer_id = @employer.id
    @user.save
  end

  def interviewees
    @employer = Employer.find(params[:id])

  end
end
