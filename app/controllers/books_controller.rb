class BooksController < ApplicationController

	def index
		@books = Book.order(title: :asc)
	end
	
	def new
		@book = Book.new
	end
	
	def show
		@book = Book.find(params[:id])
	end
	
	def create
		@book = Book.new(book_params)
		
		if @book.save
			redirect_to @book
		else
			render 'new'
		end
		
	end
	
	def edit
		@book = Book.find(params[:id])
	end
	
	def update
		@book = Book.find(params[:id])
		
		if @book.update(book_params)
			redirect_to @book
		else
			render 'edit'
		end
	end
	
	def manage_inventory
		@books = Book.all
		
	end
	
	private
	def book_params
		params.require(:book).permit(:title, :author, :isbn, :publisher, :description)
	end
end
