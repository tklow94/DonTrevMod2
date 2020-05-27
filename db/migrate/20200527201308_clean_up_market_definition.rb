class CleanUpMarketDefinition < ActiveRecord::Migration[6.0]
  def change
    rename_column :markets, :market_id, :bovada_id
    add_column :markets, :event_id, :integer
  end
end
