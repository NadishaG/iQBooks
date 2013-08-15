class ModifyColumns < ActiveRecord::Migration
	def up
		remove_column :members , :recommended
		remove_column :members , :on_demand
		add_column :members , :tagline , :string
		add_column :members , :joining_date , :date
		add_column :members , :project , :string
		add_column :book_reviews ,:rating ,:integer
		add_column :issue_records ,:returned_on ,:date
	end

	def down
	end
end
