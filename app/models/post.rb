class Post < ApplicationRecord
  belongs_to :user
  has_many :reactions

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  with_options presence: true do
    validates :title
    validates :content
    validates :category
  end

  validates :spoiler, inclusion: [true, false]
  validates :content, length: { maximum: 4000 }
end
