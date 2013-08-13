class CreateUserAttributes < ActiveRecord::Migration
  def change
    create_table :user_attributes do |t|
      t.integer :user_id
      t.integer :position
      t.string :key
      t.string :value
    end
  end
end
