class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :url

      t.timestamps
    end
  end
end
