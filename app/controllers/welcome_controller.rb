class WelcomeController < ApplicationController
  def index
    @drawrooms = Drawroom.all
  end

  def show
    # @drawroom = Drawroom.find(params[:id])
  end


  def create
    # @drawroom = Drawroom.new(painting_container: '' )
    #
    # if @drawroom.save
    #   puts "SAVEEEEE"
    #    redirect_to drawroom
    # else
    #   'mjhgvbhnjmk'
    #   # render drawroom
    #
    #  end




     @welcome = Welcome.new

       if @welcome.save
         @drawroom = Drawroom.new(painting_container: '' )
       else
        puts "NOOOOOO"
       end
     end


     # def drawroom_params
     #   params.require(:drawroom).permit(:empty, :painting_container )
     # end


  end
