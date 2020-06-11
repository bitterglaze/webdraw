class AddGuestUuidToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :guest_uuid, :string
  end
end
