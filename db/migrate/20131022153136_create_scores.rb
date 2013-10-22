class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :home_team_score
      t.string :away_team_score
      t.string :author
      t.text :description
      t.integer :event_id

      t.timestamps
    end
  end
end
