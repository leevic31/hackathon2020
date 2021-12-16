class CreateTempByStateTable < ActiveRecord::Migration[6.1]
  def change
    create_table :state_temperatures do |t|
      t.date :recordedAt
      t.decimal :averageTemperature, scale: 2, precision: 10
      t.decimal :averageTemperatureUncertainty, scale: 2, precision: 10
      t.string :state, index: true
      t.string :country, index: true
      t.timestamps default: -> { 'NOW()' }
    end
  end
end
