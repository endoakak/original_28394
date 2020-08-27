class Post < ApplicationRecord
  belongs_to :user
  has_many :reactions, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  with_options presence: true do
    validates :title
    validates :content
    validates :category
  end

  validates :spoiler, inclusion: [true, false]
  validates :content, length: { maximum: 4000 }

  def self.search(keyword)
    if keyword != ""
      Post.where("title LIKE(?)", "%#{keyword}%")
    else
      Post.all
    end
  end
end
