class UsersController < ApplicationController

  def index
    @users = User.all
    @teachers  = User.where(teacher: true)
    @students  = User.where(student: true)
  end


    def show
      @user = User.find(params[:id])
    end

end
