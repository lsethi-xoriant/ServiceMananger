class AddLogoImageLinkColumnToCompaniesTable < ActiveRecord::Migration
  def change
    remove_column :companies,:image_url
    add_column :companies,:logoImageLink,:string
  end

end
