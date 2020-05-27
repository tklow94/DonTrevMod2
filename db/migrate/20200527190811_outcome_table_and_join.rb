class OutcomeTableAndJoin < ActiveRecord::Migration[6.0]
  def change
    create_table :outcomes do |t|
      t.string :american
      t.string :decimal
      t.string :description
      t.integer :market_id
      t.integer :bovada_id
      t.string :bovada_status
      t.string :bovada_type
    end

    add_column :markets, :description, :string
    add_column :markets, :live, :boolean
  end
end
