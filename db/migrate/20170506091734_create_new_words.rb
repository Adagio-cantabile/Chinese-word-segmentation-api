class CreateNewWords < ActiveRecord::Migration[5.0]
  def change
    create_table :new_words do |t|
      t.text :word
      t.text :type
      t.boolean :valid, default: true
      t.string :user_id

      t.timestamps
    end
  end
end
