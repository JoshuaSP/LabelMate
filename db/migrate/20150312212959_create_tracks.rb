class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.references :album, index: true, null: false
      t.boolean :bonus_track, null: false
      t.text :lyrics

      t.timestamps null: false
    end
  end
end
