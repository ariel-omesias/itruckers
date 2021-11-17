class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.string :status
      t.references :user, foreign_key: true
      t.references :truck, foreign_key: true

      t.timestamps
    end
  end
end
