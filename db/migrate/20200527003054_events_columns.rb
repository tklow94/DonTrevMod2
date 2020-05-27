class EventsColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :last_modified, :datetime
    add_column :events, :sport_id, :integer
  end
end
