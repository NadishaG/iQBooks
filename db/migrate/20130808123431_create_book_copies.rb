class CreateBookCopies < ActiveRecord::Migration
	def up
		remove_column :book_reviews, :like
		remove_column :book_reviews, :dislike
	end
end
