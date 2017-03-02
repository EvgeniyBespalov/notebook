class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|

		t.integer	:user_id,	null: false
		t.string		:header,		null:	false
		t.string		:text,		null: false
		t.datetime	:date,		null:	false

      t.timestamps
    end
    
    add_index(:notes, [:header, :date],	:unique => true)
  end
end
