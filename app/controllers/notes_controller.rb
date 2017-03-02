class NotesController < ApplicationController
  before_filter :user_init?
  
	def hello
		if params[:date].nil?
 	 			@date_filter = DateTime.now
 	 	else
				@date_filter = (params[:date][:year] + '-' + params[:date][:month] + '-' + params[:date][:day]).to_date
		end
 	 	@notes = Note.where("user_id = ? AND date >= ?", @user.id, @date_filter).order(date: :desc)
 	 	respond_to do |format|
 	 		format.js { }
 	 	end
	end 
  
	def show
		@note = Note.find(params.require(:id))
		@note_tags = NoteTag.all
  end
  
  def index    
    @notes = Note.where(user_id: @user.id).order(date: :desc)
    @date_filter = (@notes.count > 0) ? @notes.last.date : DateTime.Now
  end
  
  def new
    @note = Note.new
		@note_tags = NoteTag.all 
		@operation_description = "Новая заметка" 
  end
  
  def create
    @note = Note.new(params.require(:note).permit(:header, :text))
    @note.user_id = @user.id
    @note.date = DateTime.now
    unless params[:note_tags].nil?
		@note.note_tags = NoteTag.find(params[:note_tags]) 
    end
    
	 @note_tags = NoteTag.all
		
    @note.save
    if @note.errors.empty?
      redirect_to note_path(@note)
    else
		  @operation_description = "Новая заметка" 
      render 'new'
    end
  end  
  
	def edit
		@note = Note.find(params.require(:id))
		@note_tags = NoteTag.all
		@operation_description = "Редактирование заметки" 
	end
	
	def update
			
		@note = Note.find(params.require(:id))

		@note_tags = NoteTag.all
		unless params[:note_tags].nil?
        @note.note_tags = NoteTag.find params[:note_tags]	
      else
        @note.note_tags.delete_all
      end
    
		@note.update_attributes(params[:note].permit(:header, :text))
		if @note.errors.empty?
			redirect_to @note
		else
			render 'show_errors'
		end
	end
	
	def destroy
		@note = Note.find(params.require(:id))
		@note.destroy
		
     redirect_to :action => :index
	end
  
end
