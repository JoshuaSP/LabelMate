class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, index: true, null: false, unique: true

      t.timestamps null: false
    end
  end
end
