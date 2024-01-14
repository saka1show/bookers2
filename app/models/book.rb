class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  def get_image
    if image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
    else
      '/assets/no_image.jpg'
    end
  end

end
