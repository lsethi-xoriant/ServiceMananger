class AddAccountPackageIdInUserTable < ActiveRecord::Migration
  def change
    add_column :users,:account_package_id,:integer
  end
end
