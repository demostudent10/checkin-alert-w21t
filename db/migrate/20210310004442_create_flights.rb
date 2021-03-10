class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.string :description
      t.datetime :departs_at
      t.boolean :alert_sent, { :default => false }
      t.integer :user_id

      t.timestamps
    end
  end
end
