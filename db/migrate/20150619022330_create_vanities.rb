class CreateVanities < ActiveRecord::Migration
  def change
    create_table :vanities do |t|
      t.string :vanity_url, limit: 50
      t.string :destination_url

      t.timestamps null: false
    end
    add_index :vanities, :vanity_url, unique: true
  end
end
