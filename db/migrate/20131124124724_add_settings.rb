class AddSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :timeout, null: false, default: 60
    end
    Setting.create!
  end
end
