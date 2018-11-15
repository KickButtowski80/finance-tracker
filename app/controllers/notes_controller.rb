class NotesController < ApplicationController
    def index
        @notes = Note.all
    end
    
    def new
        @note = Note.new     
        @date = params[:date]
      
    end 
    
  def create
    
    @note = Note.new(note_params)     
     if @note.save!
        @note.update!(created_at: params[:date])
        flash[:success] = "your note was saved"
        redirect_to root_path
     else
         flash[:danger] = "your note wasnot saved"
         render 'new'
     end        
  end
    
    private
    
    def set_note
    end
    
    def note_params
        params.require(:note).permit(:content) 
    end
end
