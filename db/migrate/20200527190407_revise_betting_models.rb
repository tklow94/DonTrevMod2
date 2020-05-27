class ReviseBettingModels < ActiveRecord::Migration[6.0]
  def change
    drop_table :bets

    create_table :markets do |t|
      t.integer :market_id
      t.string :period
      t.string :market_type
    end
  end
end
