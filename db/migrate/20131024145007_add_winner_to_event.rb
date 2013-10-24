class AddWinnerToEvent < ActiveRecord::Migration
  def change
    add_column :events, :winner, :string
  end
end
