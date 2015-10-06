class AddFirstNameToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :first_name, :string
  end
end
