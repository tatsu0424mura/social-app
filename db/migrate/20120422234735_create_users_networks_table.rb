class CreateUsersNetworksTable < ActiveRecord::Migration
  def change
    create_table :networks_users, :id => false do |t|
      t.references :network, :user
    end    
    
    add_index :networks_users, [:network_id, :user_id]
  end

end
