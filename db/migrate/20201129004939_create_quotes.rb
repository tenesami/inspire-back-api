class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.string :topic
      t.text :content
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
