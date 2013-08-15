	class CreateBookLikes < ActiveRecord::Migration
	def change
	 add_column :book_reviews,:like,:boolean
	 add_column :book_reviews,:must_read,:boolean
	 add_column :book_reviews,:dislike,:boolean
	end
end
