class ApplicationController < ActionController::Base
  before_action :set_player

  def set_player
    # Проверить есть ли у гостя уже идентификатор
    guest_uuid = cookies[:guest_uuid]
    puts "=========== GUEST UUID ==========="
    puts guest_uuid

    # ЕСЛИ ЕСТЬ ТО
    if guest_uuid
      # Найти последнюю активную вопрос этого гостя
      @player= Player.where(guest_uuid: guest_uuid).last
      @player ||= Player.create!(guest_uuid: guest_uuid)
    # ЕСЛИ НЕТ ТО
    else
      # Тегировать гостевого пользователя, добавляем ему идентификатор
      uuid = SecureRandom.uuid
      cookies[:guest_uuid] = uuid

      @player = Player.create!(guest_uuid: uuid)
    end
  end
#
end
