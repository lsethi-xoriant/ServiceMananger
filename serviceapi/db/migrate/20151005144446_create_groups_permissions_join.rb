class CreateGroupsPermissionsJoin < ActiveRecord::Migration
  def change
    create_table :groups_permissions,:id => false do |t|
      t.integer :group_id
      t.integer :permission_id
    end
  end
end
