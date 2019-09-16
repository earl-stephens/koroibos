class CreateAthleteEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :athlete_events do |t|
      t.string :medals
      t.references :athlete, foreign_key: true
      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
