class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company_name, :string
    add_column :users, :telephone, :string
    add_column :users, :fax, :string
    add_column :users, :web, :string
    add_column :users, :billing_address, :text
    add_column :users, :shipping_address, :text
  end
end
