class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :post

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :comment

  validates :comment, presence: true
end
