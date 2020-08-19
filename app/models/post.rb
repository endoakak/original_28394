class Post < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  with_options presence: true do
    validates :title
    validates :content
    validates :spoiler
    validates :category
  end

  validates :content, length: { maximum: 1000 }
end
