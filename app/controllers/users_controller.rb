class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    # @users = User.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
     @book = current_user.books
   unless @user == current_user
     redirect_to user_path(current_user.id)
   end 
  end

  def new
    @user = User.new
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def create
      @user = User.new(params[:id])
      @user = User.new(user_params)
      @user.user_id = current_user.id
      @user.save
       redirect_to'/show'
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

   def destroy
    @user = Books.find(params[:id])
    @user.destroy
    redirect_to users_show
   end


   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end