class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :description
      t.boolean :active

      t.timestamps null: false
    end
  end
end
