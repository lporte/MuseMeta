class CreateUser < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username
  		t.string :password_hash
  		t.string :email
  		t.string :first_name
  		t.string :last_name
  		t.string :city
  		t.string :state
  		t.string :bio, limit: 400
  		t.string :avatar

  		t.timestamps null: false
  	end
  		add_index :users, :username
  end
end
