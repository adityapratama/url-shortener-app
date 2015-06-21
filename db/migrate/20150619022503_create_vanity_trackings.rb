class CreateVanityTrackings < ActiveRecord::Migration
  def change
    create_table :vanity_trackings do |t|
      t.references :vanity, index: true
      t.string :ip_address, limit: 50
      t.string :user_agent, limit: 250

      t.timestamps null: false
    end
    add_foreign_key :vanity_trackings, :vanities
  end
end
