class AddImageUrlColumnToCompanyTable < ActiveRecord::Migration
  def change
    add_column :companies,:image_url,:string
  end
end
