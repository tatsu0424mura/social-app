class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
