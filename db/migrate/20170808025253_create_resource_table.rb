class CreateResourceTable < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
        t.string :title
        t.string :hyperlink
    end
  end
end
