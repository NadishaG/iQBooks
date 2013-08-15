class AddColumnToMember < ActiveRecord::Migration
  def change
    add_column :members, :recommended, :boolean
    add_column :members, :on_demand, :boolean
  end
end
