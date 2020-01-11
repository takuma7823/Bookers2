class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = Book.all
    @book = Book.new
    @user = User.find_by(id: current_user.id)
  end

  def show
  	@book = Book.find(params[:id])
    @user = @book.user
    @books = Book.new
  end


  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
      flash[:notice] = "You have created book successfully."
    else
      @user = User.find_by(id: current_user.id)
      @books = Book.all
      render 'books/index'
    end
  end
  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to books_path
    end
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
      flash[:notice] = "You have updated book successfully."
    else
      render 'books/edit'
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path(current_user.id)
  end
  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
