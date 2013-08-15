class CreateBookReviews < ActiveRecord::Migration
  def change
    create_table :book_reviews do |t|
      t.references :book
      t.references :user
      t.string :review

      t.timestamps
    end
    add_index :book_reviews, :book_id
    add_index :book_reviews, :user_id
  end
end
