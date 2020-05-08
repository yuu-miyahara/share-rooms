class CreateBans < ActiveRecord::Migration[5.2]
  def change
    create_table :bans do |t|
      t.references :user, foreign_key: true, type: :string
      t.references :banner, foreign_key: { to_table: :users }, type: :string

      t.timestamps
      t.index [:user_id, :banner_id], unique: true
    end
  end
end
