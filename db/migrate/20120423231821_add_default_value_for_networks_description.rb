class AddDefaultValueForNetworksDescription < ActiveRecord::Migration
  def up
    change_column :networks, :description, :string, default: ""
  end

  def down
  end
end
