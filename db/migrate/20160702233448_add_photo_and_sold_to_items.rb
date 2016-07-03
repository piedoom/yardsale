class AddPhotoAndSoldToItems < ActiveRecord::Migration[5.0]
  def change
    add_attachment :items, :photo
    add_column :items, :available, :boolean, :default => true
  end
end
