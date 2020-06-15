class DrawroomController < ApplicationController

  def index
    @drawrooms = Drawroom.all
  end

  def new
  end


  def show
    @drawroom = Drawroom.find(params[:id])
  end


 def create
   @drawroom = Drawroom.new(painting_container: '')
   if @drawroom.save
      redirect_to @drawroom
   else
     'mjhgvbhnjmk'
    end
 end


 def drawroom_params
   params.require(:drawroom).permit(:empty, :painting_container )
 end

end
