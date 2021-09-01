class Venue < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '札幌' },
    { id: 3, name: '仙台' },
    { id: 4, name: '東京' },
    { id: 5, name: '横浜' },
    { id: 6, name: '名古屋' },
    { id: 7, name: '京都' },
    { id: 8, name: '大阪' },
    { id: 9, name: '広島' },
    { id: 10, name: '福岡' },
    { id: 11, name: '那覇' }
]

include ActiveHash::Associations
  has_many :users
end
 