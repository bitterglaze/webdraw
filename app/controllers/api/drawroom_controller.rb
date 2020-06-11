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
   drawroom = Drawroom.find(params[:id])
   drawroom.update(drawroom_params)

   puts "UPDATED"
   render json:{}

   puts drawroom
   ActionCable.server.broadcast 'canvas_channel', drawroom
 end

 def drawroom_params
   params.require(:drawroom).permit(:empty, :painting_container )
 end

  # def sync
  #
  # end
end



def get_player
  guest_uuid = cookies[:guest_uuid]
  @player = Player.where(guest_uuid: guest_uuid).last
 end
