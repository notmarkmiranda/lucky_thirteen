class CreateLeagues < ActiveRecord::Migration[7.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :description
      t.string :location
      t.boolean :public_league, default: false

      t.timestamps
    end
  end
end
