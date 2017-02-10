class CreateStaffMembers < ActiveRecord::Migration[5.0]
  def up
    create_table :staff_members do |t|
      t.string "name"
      t.text "bio"
      t.binary "imageData", :limit =>1.megabyte
      t.string "imageName"

      t.timestamps
    end
  end

  def down
    drop_table :staff_members
  end
end
