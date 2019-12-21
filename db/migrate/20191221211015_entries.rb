class Entries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :country
      t.text :content
    end
  end
end
