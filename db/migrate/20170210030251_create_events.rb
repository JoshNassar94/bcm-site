class CreateEvents < ActiveRecord::Migration[5.0]
  def up
    create_table :events do |t|
      t.string "title"
      t.text "description"
      t.string "location"
      t.datetime "event_date"
      t.binary "imageData", :limit =>1.megabyte
      t.string "imageName"

      t.timestamps
    end
  end

  def down
    drop_table :events
  end
end
