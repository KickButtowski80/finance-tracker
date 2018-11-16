class NotesController < ApplicationController
    def index
        @notes = Note.includes(:user).where("Date(created_at)= ? ",  date_params[:date])
    end
    
    def new
        @note = Note.new     
        @note_date = date_params[:date]      
    end 
    
  def create
    @note_date = date_params[:date]
    @note = Note.new(note_params) 
    @note.user_id = current_user.id
     if @note.save!
        @note.update!(created_at: @note_date)
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

    def date_params
        params.permit(:date)
    end
    def note_params
        params.require(:note).permit(:content)
    end
end
