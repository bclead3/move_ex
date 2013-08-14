class RemovePositionColumnForUserAttributes < ActiveRecord::Migration
  def up
    remove_column :user_attributes, :position
  end

  def down
    add_column :user_attributes, :position, :integer
  end
end
