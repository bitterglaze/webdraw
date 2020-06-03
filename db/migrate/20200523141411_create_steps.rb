class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.integer :position
      t.boolean :opening_step
      t.integer :player_id

      t.timestamps
    end
  end
end
