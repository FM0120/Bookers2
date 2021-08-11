class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end


  def edit
     @book = Book.find(params[:id])
     @user = @book.user
    unless @user == current_user
     redirect_to books_path
    end
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = User.find_by(id: @book.user_id)
  end

  def create
    @book = Book.new(book_params)
    @user = current_user
    flash[:notice] = "You have created book successfully."
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
    flash[:notice] = "You  have updated book successfully."
    redirect_to book_path(@book)
   else
    render :edit
   end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
