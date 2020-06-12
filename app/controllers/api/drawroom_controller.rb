class Api::DrawroomController < Api::ApplicationController
before_action :get_player, only: [:show, :edit, :update, :destroy]


  def index
   drawrooms = Drawroom.all
   drawrooms_array = []

   drawrooms.each do |drawroom|
     drawrooms_array << drawroom.as_json
  end

   # puts drawrooms_array
   render json: drawrooms_array
 end


 def update

   puts '================= drawroom_params ======='
   puts drawroom_params[:painting_container]

   if drawroom_params[:painting_container] != ''
     drawroom = Drawroom.find(params[:id])

     painting_container = drawroom.painting_container
     painting_container = painting_container.delete_suffix(']')
     puts '================= painting_container ======='
     puts painting_container


     if painting_container == '['
      painting_container = painting_container + drawroom_params[:painting_container] + ']'
    else
      painting_container = painting_container + ',' + drawroom_params[:painting_container] + ']'
     end

     puts '================= painting_container ======='
     puts painting_container

     # drawroom.painting_container = painting_container
     drawroom.update_attribute(:painting_container, painting_container )
     drawroom = Drawroom.find(params[:id])

     puts "UPDATED"
     render json:{}

     puts drawroom
     ActionCable.server.broadcast 'canvas_channel', drawroom
   end
 end


 def drawroom_params
   params.require(:drawroom).permit(:empty, :painting_container )
 end

  # def sync
  #
  # end
end



# def get_player
#   guest_uuid = cookies[:guest_uuid]
#   @player = Player.where(guest_uuid: guest_uuid).last
# end
