class Comment < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    { id: 1, name: "わかります！" },
    { id: 2, name: "気になります！" },
    { id: 3, name: "面白い考えですね！" }
  ]
  has_many :reactions
end