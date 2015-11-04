class CreateGroupsStoresJoinTable < ActiveRecord::Migration
  def change
    create_table :groups_stores,:id => false do |t|
      t.integer :group_id
      t.integer :store_id
    end
  end
end
