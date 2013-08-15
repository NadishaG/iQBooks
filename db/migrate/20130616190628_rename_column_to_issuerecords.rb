class RenameColumnToIssuerecords < ActiveRecord::Migration
  def change
  	rename_column :issue_records ,:user_id ,:member_id
  end
end
