class AddEventIdToEventTeams < ActiveRecord::Migration
  def up
    add_column :event_teams, :event_id, :integer
  end

  def down
    remove_column :event_teams, :event_id
  end
end
