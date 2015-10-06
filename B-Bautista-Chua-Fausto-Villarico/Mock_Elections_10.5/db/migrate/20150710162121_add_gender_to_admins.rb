class AddGenderToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :gender, :string
  end
end
