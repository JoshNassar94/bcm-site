class CreateChurches < ActiveRecord::Migration[5.0]
  def up
    create_table :churches do |t|
      t.string "name"
      t.text "description"
      t.text "address"
      t.string "website"

      t.timestamps
    end
  end

  def down
    drop_table :churches
  end
end
