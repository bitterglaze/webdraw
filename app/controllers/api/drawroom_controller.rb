class Api::DrawroomController < Api::ApplicationController
  def index

  end

  def sync
    puts params['drawroom']['points']
    ActionCable.server.broadcast 'canvas_channel', params['drawroom']['points'].to_json
  end
end
