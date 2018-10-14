class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :reporter_id, :integer
    add_column :users, :receiver_id, :integer
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :bio, :string
  end
end
