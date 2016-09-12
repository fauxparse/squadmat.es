class CreateSquads < ActiveRecord::Migration[5.0]
  def change
    create_table :squads do |t|
      t.string :name, limit: 64
      t.string :slug, limit: 32

      t.timestamps

      t.index :slug, unique: true
    end
  end
end
