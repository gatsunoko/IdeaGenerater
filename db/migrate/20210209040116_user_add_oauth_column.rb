class UserAddOauthColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :name, :string
    add_column :users, :token, :string
    add_column :users, :image, :string
    add_column :users, :role, :integer, default: 1, null: false
  end
end
