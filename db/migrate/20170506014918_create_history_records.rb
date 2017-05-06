class CreateHistoryRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :history_records do |t|
      t.text :before_change
      t.text :after_change
      t.text :data
      t.string :user_id

      t.timestamps
    end
  end
end
