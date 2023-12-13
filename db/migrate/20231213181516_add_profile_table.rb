class AddProfileTable < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user,        null: false, index: { unique: true }, foreign_key: { on_delete: :cascade }
      t.string     :description, null: true
      t.string     :picture,     null: true
      t.string     :slug,        null: true

      t.timestamps
    end
  end
end
