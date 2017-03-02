class CreateNoteTagsNotes < ActiveRecord::Migration
  def self.up
    create_table :note_tags_notes do |t|
    	t.references	:note_tag
    	t.references	:note
    end
    add_index(:note_tags_notes, [:note_id, :note_tag_id], :unique => true)
    add_index(:note_tags_notes, [:note_tag_id, :note_id], :unique => true)
  end
  
  def self.down
    remove_index(:note_tags_notes, [:note_id, :note_tag_id])
    remove_index(:note_tags_notes, [:note_tag_id, :note_id])
  	drop_table	:note_tags_notes
  end
end
