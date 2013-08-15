class RemoveDescriptionFromMembers < ActiveRecord::Migration
  def up
  	remove_column :members, :description
  end

  def down
  end
end
