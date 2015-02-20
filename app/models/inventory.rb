class Inventory < ActiveRecord::Base
  belongs_to :library
  belongs_to :book
  
  validates :library_id, presence: true
  validates :book_id, presence: true
  #validates :count, presence true, numericality: { only_integer: true, greater_than_or_euqal_to: 0 }
end
