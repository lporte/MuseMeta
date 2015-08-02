class CreateRelationshipsJoinTable < ActiveRecord::Migration
  def change
  	create_table :relationships do |t|
  		t.integer :museum_id
  		t.integer :artist_id
  	end
  end
end
