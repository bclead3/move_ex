class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :postal_code

      t.timestamps
    end
  end
end
