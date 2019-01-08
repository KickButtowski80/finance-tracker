class NotesController < ApplicationController
    before_action :check_same_user, only: [:index]
    def index    
       @notes = Note.includes(:user).where("user_id = ? and Date(created_at)= ? ", date_params[:id] , date_params[:date])
    end
    
    def new
        @note = Note.new     
        @note_date = date_params[:date]      
    end 
    
  def create
    @note_date = date_params[:date].to_time
    @note = Note.new(note_params) 
    @note.user_id = current_user.id
    @note.update_attributes!(created_at: @note_date)
     if @note.save!  
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
        params.permit(:id, :date)
    end

    def note_params
        params.require(:note).permit(:content)
    end
    
    def check_same_user
       if  current_user.id != date_params[:id].to_i        
            flash[:danger] = "You can only see your notes"
            redirect_to root_path
        end
    end
 
end
