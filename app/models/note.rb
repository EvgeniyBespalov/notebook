class Note < ActiveRecord::Base
	
  belongs_to	:user	
  has_and_belongs_to_many	:note_tags
	
  validates :header, :text, presence: true	
	
end
