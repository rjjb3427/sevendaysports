class CreateEventTeams < ActiveRecord::Migration
  def up
    create_table :event_teams do |t|
      t.integer :home_team_id
      t.integer :away_team_id

      t.timestamps
    end
  end

  def down
    remove_table :event_teams
  end
end
