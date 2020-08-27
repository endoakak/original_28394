class Comment < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    { id: 1, name: "その気持ち、わかります！" },
    { id: 2, name: "その作品、気になります！" },
    { id: 3, name: "その考え、面白いですね！" }
  ]
  has_many :reactions
end
