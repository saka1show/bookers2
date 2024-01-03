class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  def get_image
    if image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
    else
      '/assets/no_image.jpg'
    end
  end

end
