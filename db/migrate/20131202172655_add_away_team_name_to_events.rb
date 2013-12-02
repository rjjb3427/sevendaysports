class AddAwayTeamNameToEvents < ActiveRecord::Migration
  def change
    add_column :events, :away_team_name, :string
  end
end
