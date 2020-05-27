class ReviseSportsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :sports, :name
    add_column :sports, :sport_name, :string
    add_column :sports, :sub_name, :string
  end
end
