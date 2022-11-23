class UsersController < ApplicationController
  before_action :find_user, only: [ :edit, :show, :update, :destroy ]

  def index
    @users = User.all
  end
  
  def create
    @user = User.new( user_params )
    if @user.save
      redirect_to :root, notice: "使用者新增成功"
    else
      flash.now[:alert] = @user.errors.full_messages
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
    if @user.update( user_params )
      redirect_to :root, notice: "使用者修改成功"
    else
      flash.now[:alert] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy    
    @user.delete
    redirect_to :root, notice: "使用者已刪除"
  end
end

private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def find_user
    @user = User.find(params[:id])
  end