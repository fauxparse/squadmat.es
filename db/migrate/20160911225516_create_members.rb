class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.belongs_to :squad, foreign_key: { on_delete: :cascade }
      t.string :name, limit: 64
      t.string :email, limit: 256
      t.boolean :manager, required: true, default: false

      t.timestamps

      t.index [:squad_id, :id], unique: true
      t.index [:squad_id, :email], unique: true
    end
  end
end
