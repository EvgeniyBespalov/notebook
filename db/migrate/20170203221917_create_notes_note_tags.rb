class CreateNotesNoteTags < ActiveRecord::Migration
  def self.up
    create_table :notes_note_tags do |t|
    	t.references	:note
    	t.references	:note_tag
    end    
    add_index(:notes_note_tags, [:note_id, :note_tag_id], :unique => true)
    add_index(:notes_note_tags, [:note_tag_id, :note_id], :unique => true)
  end
  
  def self.down
    remove_index(:notes_note_tags, [:note_id, :note_tag_id])
    remove_index(:notes_note_tags, [:note_tag_id, :note_id])
  	drop_table	:notes_note_tags
  end
end
