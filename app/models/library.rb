class Library < ActiveRecord::Base
	has_many :inventories, class_name: "Inventory",
							foreign_key: "library_id",
							dependent: :destroy
	has_many :books, through: :inventories
	
	has_many :requests, class_name: "Request",
							foreign_key: "library_id"
							
	validates :name, presence: true
	validates :address, presence: true
	validates :city, presence: true
	validates :state, presence: true, length: { is: 2 }
	validate :validate_zip
	
	#Add a book to the libraries inventory list with a count of 1
	def addBook(book)
		inventories.create(book_id: book.id)
	end
	
	#Remove any refrences to this book from the inventory
	def removeBook(book)
		inventories.find_by(book_id: book.id).destroy
	end
	
	#Returns true if this book is already in inventory
	def inInventory?(book)
		books.include?(book)
	end
	
	#Record a request for a book
	def requestBook(book)
		request = requests.find_by(book_id: book.id)
		
		if request
			request.count += 1
			request.save
		else
			request = requests.create(book_id: book.id, count: 1)
			
		end
			
	end
	
	#Returns the number of requests for this book
	def requestCount(book)
		@request = requests.find_by("book_id = ?", book.id)
		
		if @request
			@request.count
		else
			0
		end
	end
	
	#Returns the libraries most popular book
	def mostPopularBook
		@requests = requests.order('count desc')
		if @requests.count > 0
			@book = @requests.at(0).book
		else
			nil
		end
	end
	
	#Returns the libraries top 10 most requested books
	def topTenBooks
		@requests = requests.order('count desc').limit(10)
	end
	
	private
	def validate_zip
		# A US zip must match the following format ddddd or ddddd-dddd
		unless zip =~ /\A\d{5}\z|\A\d{5}-{1}\d{4}\z/
			errors.add(:zip, "A US zip code must be either 5 digits or the zip+4 format including the dash")
		end
	end
	
	
end
