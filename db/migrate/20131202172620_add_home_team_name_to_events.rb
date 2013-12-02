class AddHomeTeamNameToEvents < ActiveRecord::Migration
  def change
    add_column :events, :home_team_name, :string
  end
end
