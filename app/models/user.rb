class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :reactions

  validates :name, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?[\d])\w{6,12}\z/.freeze
  validates :password, format: { with: PASSWORD_REGEX, message: "は6文字以上12文字以下で英数字混合で入力してください", on: :create }
end
