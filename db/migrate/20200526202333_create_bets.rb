class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.string :amount

    end
  end
end
