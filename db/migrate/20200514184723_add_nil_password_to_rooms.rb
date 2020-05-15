class AddNilPasswordToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :nil_password, :integer
  end
end
