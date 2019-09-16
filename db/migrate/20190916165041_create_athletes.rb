class CreateAthletes < ActiveRecord::Migration[5.2]
  def change
    create_table :athletes do |t|
      t.string :name
      t.integer :age
      t.string :sex
      t.integer :height
      t.integer :weight
      t.string :team
      t.timestamps
    end
  end
end
