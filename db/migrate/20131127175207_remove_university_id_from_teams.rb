class RemoveUniversityIdFromTeams < ActiveRecord::Migration
  def up
    remove_column :teams, :university_id
  end

  def down
    add_column :teams, :university_id, :integer
  end
end
