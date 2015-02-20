class SearchController < ApplicationController

	def new
		if params[:title_search]
			@inventory = Inventory.joins(:book).joins(:library).where("books.title like ?", "#{params[:title_search]}%").order("books.title asc").order("libraries.name asc")
			
		elsif params[:isbn_search]
			@inventory = Inventory.joins(:book).joins(:library).where("books.isbn = ?", params[:isbn_search]).order("books.title asc").order("libraries.name asc")
			
		else
			@inventory = Inventory.joins(:book).joins(:library).order("books.title asc").order("libraries.name asc")
			
		end

	end
end
