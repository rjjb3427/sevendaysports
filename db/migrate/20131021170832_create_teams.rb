class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :sport_type
      t.integer :university_id

      t.timestamps
    end
  end
end
