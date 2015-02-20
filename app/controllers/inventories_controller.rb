class InventoriesController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		library = Library.find(params[:library_id])
		library.addBook(book)
		redirect_to manage_inventory_books_path
	end
	
	def destroy
		book = Inventory.find(params[:id]).book
		library = Library.find(params[:library_id])
		library.removeBook(book)
		redirect_to manage_inventory_books_path
	end
end
