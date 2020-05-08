class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :string  do |t|
      t.string :name
      t.integer :ban_number

      t.timestamps
    end
  end
end
