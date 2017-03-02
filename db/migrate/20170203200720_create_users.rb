class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    
    	t.integer	:user_role_id,	null: false
		t.string		:login,			null: false
		t.string		:password, 		null: false
		
      t.timestamps
    end
    
    add_index(:users, [:login],	:unique => true)
  end
end
