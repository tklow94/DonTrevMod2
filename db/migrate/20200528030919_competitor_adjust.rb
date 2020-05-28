class CompetitorAdjust < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :name
    add_column :competitors, :bovada_id, :string
    remove_column :competitors, :is_team
    remove_column :competitors, :competitor_id
  end
end
