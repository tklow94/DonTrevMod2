class CreateWatchLists < ActiveRecord::Migration[6.0]
  def change
    create_table :watch_lists do |t|
      t.string :kind
      t.integer :model_id
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
