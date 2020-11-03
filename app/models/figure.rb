class Figure < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '細い' },
    { id: 3, name: 'やや細い' },
    { id: 4, name: '普通' },
    { id: 5, name: 'ぽっちゃり' },
    { id: 6, name: 'ふくよか' }
  ]

  include ActiveHash::Associations
  has_many :users

end
