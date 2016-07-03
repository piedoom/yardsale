class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :price_cents, default: 0
      t.boolean :negotiable, default: false

      t.timestamps
    end
  end
end
