class AddPaintingsContainerToDrawroom < ActiveRecord::Migration[6.0]
  def change
    add_column :drawrooms, :painting_container, :string
  end
end
