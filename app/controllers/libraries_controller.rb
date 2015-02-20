class LibrariesController < ApplicationController

	def new
		@library = Library.new
	end
	
	def index
		@libraries = Library.all
	end
	
	def show
		@library = Library.find(params[:id])
		session[:library_id] = @library.id
	end
	
	def create
		@library = Library.new(library_params)
		
		if @library.save 
			redirect_to @library
		
		else
			render 'new'
			
		end
	end
	
	def edit
		@library = Library.find(params[:id])
		
	end
	
	def update
		@library = Library.find(params[:id])
		
		if @library.update(library_params)
			redirect_to @library
		
		else
			render 'edit'
			
		end
	end
	
	# This libraries book inventory
	def book_inventory
		@library = Library.find(params[:id])
		
		if params[:title_search]
			@inventory = Inventory.joins(:book).where("library_id = ? and books.title like ?", @library.id, "#{params[:title_search]}%")
			
		elsif params[:isbn_search]
			@inventory = Inventory.joins(:book).where("library_id = ? and books.isbn = ?", @library.id, params[:isbn_search])

		else
			@inventory = Inventory.where("library_id = ?", @library.id)
		end

		#redirect_to books_library_path(@inventory)
	end
	
	# This libraries book requests sorted by request count descending
	def requests
		@library = Library.find(params[:id])
		@requests = @library.requests.order(count: :desc)
		
	end
	
	private
	def library_params
		params.require(:library).permit(:name, :address, :city, :state, :zip)
	end
	
end
