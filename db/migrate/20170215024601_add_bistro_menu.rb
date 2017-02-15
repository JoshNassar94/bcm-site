class AddBistroMenu < ActiveRecord::Migration[5.0]
  def up
    create_table :menus do |t|
      t.text "menu"
      t.date "event_date"

      t.timestamps
    end
  end

    def down
      drop_table :menus
    end
end
