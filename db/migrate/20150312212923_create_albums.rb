class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.references :band, index: true, null: false
      t.boolean :live_album, null: false

      t.timestamps null: false
    end
  end
end
