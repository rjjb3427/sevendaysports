class AddIsHomeTeamToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :is_home_team, :boolean
  end
end
