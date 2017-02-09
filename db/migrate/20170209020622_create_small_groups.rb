class CreateSmallGroups < ActiveRecord::Migration[5.0]
  def up
    create_table :small_groups do |t|
      t.string "leader1"
      t.string "leader2"
      t.string "group_type"
      t.text "description"
      t.string "location"
      t.string "day"
      t.string "time"
      t.binary "imageData", :limit =>1.megabyte
      t.string "imageName"

      t.timestamps
    end
  end

  def down
    drop_table :small_groups
  end
end
