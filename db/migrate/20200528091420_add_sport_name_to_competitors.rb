class AddSportNameToCompetitors < ActiveRecord::Migration[6.0]
  def change
    add_column :competitors, :sport_name, :string
  end
end
