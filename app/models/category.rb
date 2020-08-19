class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: "小説" },
    { id: 2, name: "映画" },
    { id: 3, name: "マンガ" },
    { id: 4, name: "アニメ" }
  ]
end
