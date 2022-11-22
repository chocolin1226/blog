class UsersController < ApplicationController
  def index
  end
  
  def create
    @user = User.new( user_params )
    if @user.save
      redirect_to :root, notice: "使用者新增成功"
    else
      render :new
    end
  
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end

private

  def user_params
    params.require(:user).permit(:name, :email)
  end
