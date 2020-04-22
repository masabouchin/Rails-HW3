class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show,:index,:edit]
  
  def index
    @users = User.all 
    @book = Book.new
    @user = current_user
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    if params[:id] != current_user.id.to_s
      redirect_to user_path(current_user.id)
      end
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Book was successfully updated" 
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def destroy
    user = user.find(params[:id])
    if user.destroy
    flash[:notice] = "Book was successfully destroyed"
    redirect_to user_path(@user.id)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end
end
