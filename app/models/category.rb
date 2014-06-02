class Category < ActiveRecord::Base;
  has_many :videos

  def recent_videos
    Video.where(category_id: self.id).limit(6).order('created_at desc')
  end
end  