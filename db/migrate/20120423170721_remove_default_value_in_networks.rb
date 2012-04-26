class RemoveDefaultValueInNetworks < ActiveRecord::Migration
  def up
    change_column :networks, :description, :string, default: nil
  end

  def down
    change_column :networks, :description, :string, default: "Add a description for this network"
  end
end
