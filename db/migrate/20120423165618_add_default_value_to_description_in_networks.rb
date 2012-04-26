class AddDefaultValueToDescriptionInNetworks < ActiveRecord::Migration
  def change
    change_column :networks, :description, :string, default: "Add a description for this network"
  end
end
