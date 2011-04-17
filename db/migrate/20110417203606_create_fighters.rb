class CreateFighters < ActiveRecord::Migration
  def self.up
    create_table :fighters do |t|
      t.string :name
      t.string :fighter_type
      t.string :primary_weapon
      t.string :secondary_weapon
      t.string :pilot_name
      t.text :description
      t.int :cost
      t.int :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :fighters
  end
end
