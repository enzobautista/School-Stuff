class AddBirthdayToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :birthday, :date
  end
end
