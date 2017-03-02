class CreateNoteTags < ActiveRecord::Migration
  def change
    create_table :note_tags do |t|

		t.string		:description,	null: false

      t.timestamps
    end

    add_index(:note_tags, [:description],	:unique => true)
  end
end
