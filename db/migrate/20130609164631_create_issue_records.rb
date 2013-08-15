class CreateIssueRecords < ActiveRecord::Migration
  def change
    create_table :issue_records do |t|
      t.references :book
      t.references :user
      t.date :due_date

      t.timestamps
    end
    add_index :issue_records, :book_id
    add_index :issue_records, :user_id
  end
end
