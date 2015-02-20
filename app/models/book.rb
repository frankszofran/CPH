class Book < ActiveRecord::Base
	has_many :inventories, class_name: "Inventory",
							foreign_key: "book_id",
							dependent: :destroy
	has_many :libraries, through: :inventories
	
	validates :title, presence: true
	validates :author, presence: true, length: { minimum: 5 }
	validate :check_isbn
	
	
	
	private
	
	#Check that the value entered for the ISBN meets the basic requirements
	def check_isbn
		#ISBNs can only contain numbers
		unless isbn !~ /\D/
			errors.add(:isbn, "can only contain digits")
		end
		
		#ISBNs can be either 10 (old isbns) or 13 (for new books)
		unless isbn.size == 0 or isbn.size == 10 or isbn.size == 13
			errors.add(:isbn, "can only be 10 or 13 characters long")
		end
		
		#TODO Check that the ISBN does not already exist
	end
end
