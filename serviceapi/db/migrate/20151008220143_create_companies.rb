class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :email
      t.string :name
      t.string :city
      t.string :country
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
