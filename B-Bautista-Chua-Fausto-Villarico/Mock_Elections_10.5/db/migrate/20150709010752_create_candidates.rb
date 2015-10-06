class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.text :slogan
      t.integer :position_id

      t.timestamps null: false
    end
  end
end
