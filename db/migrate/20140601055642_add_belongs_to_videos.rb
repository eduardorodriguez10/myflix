class AddBelongsToVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :category_id
    change_table :videos do |t|
      t.belongs_to :category
    end
  end
end
