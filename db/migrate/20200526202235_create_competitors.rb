class CreateCompetitors < ActiveRecord::Migration[6.0]
  def change
    create_table :competitor do |t|
      t.string :name
      t.boolean :is_team
    end
  end
end
