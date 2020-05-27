class EventsTableTweak < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :event_id, :bovada_id
  end
end
