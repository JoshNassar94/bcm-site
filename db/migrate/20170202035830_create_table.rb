class CreateTable < ActiveRecord::Migration[5.0]

  def up
    create_table :users do |t|
      t.string "first_name", :string
      t.string "last_name"
      t.string "email", :default => '', :null => false
      t.string "password_digest"

      t.timestamps


    end
  end

  def down
    drop_table :users
  end
end
