class RequestsController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		library = Library.find(params[:library_id])
		library.requestBook(book)
		redirect_to book_inventory_library_path(library)
	end

end
