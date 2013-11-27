class AddUniversityIdToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :university_id, :integer, null: false
  end
end
