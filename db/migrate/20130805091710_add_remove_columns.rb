class AddRemoveColumns < ActiveRecord::Migration
  def up
  	remove_column :members ,:admin 
  	change_column :members ,:description ,:text
  	rename_column :books ,:user_id,:member_id
  	change_column :books ,:description ,:text
  	rename_column :book_reviews ,:user_id,:member_id
		change_column :book_reviews ,:review ,:text
  end

  def down
  end
end
