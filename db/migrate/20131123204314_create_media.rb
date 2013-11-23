class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :author
      t.text :details
      t.string :title
      t.string :url
      t.string :mediable_type
      t.integer :mediable_id

      t.timestamps
    end
    add_index :media, [:mediable_id, :mediable_type]
  end
end
