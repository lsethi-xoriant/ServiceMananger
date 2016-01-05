class AddAddressAndLogoImageLinkToStoresTable < ActiveRecord::Migration
  def change
    add_column :stores,:address,:string
    add_column :stores,:logoImageLink,:string
  end
end
