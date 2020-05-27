class RemoveLeaguesAddToSports < ActiveRecord::Migration[6.0]
  def change
    drop_table :leagues
    rename_table :competitor, :competitors
    add_column :competitors, :competitor_id, :integer

    create_join_table :competitors, :events
  end
end
