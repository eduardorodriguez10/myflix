class Video < ActiveRecord::Base;
  validates :title, :description, presence: true
  belongs_to :category

  def self.search_by_title(search_string)
    where("title ILIKE ?", "%#{search_string}%")
  end
end  