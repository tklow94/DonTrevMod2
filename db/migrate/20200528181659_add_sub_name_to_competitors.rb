class AddSubNameToCompetitors < ActiveRecord::Migration[6.0]
  def change
    add_column :competitors, :sub_name, :string
  end
end
