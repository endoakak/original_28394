class Post < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  end

  with_options presence: true do
    validates :title
    validates :content
    validates :spoiler
    validates :category
  end
end
