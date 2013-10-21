class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :author
      t.string :title
      t.text :details
      t.string :url
      t.string :type
      t.integer :event_id
      t.integer :team_id
      t.integer :user_id

      t.timestamps
    end
  end
end
