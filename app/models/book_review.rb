class BookReview < ActiveRecord::Base

	belongs_to :book
	belongs_to :member

	attr_accessible :review , :book_id , :member_id, :rating, :must_read

	def self.all_ratings(_book)
		self.where(:book_id=>_book.id).where('rating is not null')
	end
end
