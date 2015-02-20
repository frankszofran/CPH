require 'test_helper'

class LibrariesControllerTest < ActionController::TestCase

   
   test "should add and remove a book from a libraries inventory" do
		central = libraries(:one)
		book1 = books(:one)
		
		assert_not central.inInventory?(book1)
		
		#Add the book and check
		central.addBook(book1)
		assert central.inInventory?(book1)
		
		#remove the book and check
		central.removeBook(book1)
		assert_not central.inInventory?(book1)
	end
	
	test "should record book requests for a library" do
		central = libraries(:one);
		book1 = books(:one)
		
		assert central.requestCount(book1) == 0
		central.requestBook(book1)
		
		assert central.requestCount(book1) == 1
		
		central.requestBook(book1)
		central.requestBook(book1)
		assert central.requestCount(book1) == 3
		
	end
	
	test "should sort and total requests by book" do
		central = libraries(:one)
		book1 = books(:one)
		book2 = books(:two)
		
		assert central.mostPopularBook.nil?
		
		central.requestBook(book1)
		central.requestBook(book1)
		central.requestBook(book2)
		
		popular = central.mostPopularBook
		
		assert_not popular.nil?
		assert popular.id == book1.id
	end
end
