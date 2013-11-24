class AddCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :word
      t.string :taboo1
      t.string :taboo2
      t.string :taboo3
      t.string :taboo4
      t.string :taboo5
    end
  end
end
