class DropTableWelcomes < ActiveRecord::Migration[6.0]
  def change
    drop_table :welcomes
  end
end
