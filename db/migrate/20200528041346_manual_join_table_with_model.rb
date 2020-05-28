class ManualJoinTableWithModel < ActiveRecord::Migration[6.0]
  def change
    drop_join_table :competitors, :events
    create_table :involvements do |t|
      t.integer :competitor_id, null: false 
      t.integer :event_id, null: false
    end
    
  end
end
