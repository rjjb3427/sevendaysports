class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :title
      t.string :author
      t.text :details
      t.datetime :event_on
      t.string :home_team_score
      t.string :away_team_score
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :user_id

      t.timestamps
    end
  end
end
