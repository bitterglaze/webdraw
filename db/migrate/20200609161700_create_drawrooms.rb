class CreateDrawrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :drawrooms do |t|
      t.boolean :empty

      t.timestamps
    end
  end
end
