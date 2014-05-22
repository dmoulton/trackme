class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.float :lat
      t.float :lon
      t.datetime :timestamp
      t.float :hdop
      t.float :altitude
      t.float :speed
      t.float :bearing
      t.integer :profile_id
      t.integer :user_id

      t.timestamps
    end
  end
end
