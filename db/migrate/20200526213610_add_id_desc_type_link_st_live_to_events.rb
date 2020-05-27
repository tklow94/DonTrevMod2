class AddIdDescTypeLinkStLiveToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_id, :integer
    add_column :events, :description, :string
    add_column :events, :event_type, :string
    add_column :events, :link, :string
    add_column :events, :start_time, :datetime
  end
end
