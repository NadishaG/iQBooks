class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.references :user
      t.integer :copy
      t.string :status

      t.timestamps
    end
    add_index :books, :user_id
  end
end
