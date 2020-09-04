class Inquiry
  include ActiveModel::Model

  attr_accessor :name, :name_kana, :email, :message

  with_options presence: { message: "を入力してください" } do
    validates :name
    validates :name_kana
    validates :email
    validates :message
  end
end
