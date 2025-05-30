class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy

    #shop_nameが存在しているかを確認するバリデーション
    validates :book_name, presence: true
    #imageが存在しているかを確認するバリデーション
    validates :image, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
end
