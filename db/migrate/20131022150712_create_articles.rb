class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :body
      t.integer :event_id

      t.timestamps
    end
  end
end
