class CreateArtworks < ActiveRecord::Migration
  def change
  	create_table :artworks do |t|
  		t.string :title
  		t.string :source
  		t.string :date
      t.string :img_url
  		t.references :artist, index: true
  		t.references :museum, index: true

  		t.timestamps null: false
  	end
  end
end
