class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|

		t.string	:name, 			null: false
		t.string	:description,	null: false
		
      t.timestamps
    end
    
    add_index(:user_roles, [:name], 			:unique => true)
    add_index(:user_roles, [:description],	:unique => true)
  end
end
