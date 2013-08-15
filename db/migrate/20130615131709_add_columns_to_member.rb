class AddColumnsToMember < ActiveRecord::Migration
  def change
    add_column :members, :image, :string
    add_column :members, :admin, :boolean
  end
end
