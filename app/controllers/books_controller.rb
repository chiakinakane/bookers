class BooksController < ApplicationController
  def top
  end

  def index
   @books = Book.all
   @book = Book.new
  end
  

  
   def create
    @book = Book.new(book_params)
    
    if @book.save
       redirect_to book_path(@book.id), success: 'Book was successfully created.'
    else
      flash.now[:danger] = "登録に失敗しました"
      @books = Book.all
      render :index
    end  
  end
  
  def show
   @book = Book.find(params[:id])
   
  end
  
  
  def edit
   @book = Book.find(params[:id])
  end
  
  
  def update
    @book = Book.find(params[:id])
     if @book.update(book_params)
       redirect_to book_path(@book.id), notice: 'Book was successfully updated.'
    else
      render :edit
    end  
  end
  
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト 
    
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
