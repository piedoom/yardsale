class AddUseQrToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :use_qr, :boolean, :default => false
  end
end
