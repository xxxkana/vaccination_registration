class BloodType < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'A型' },
    { id: 3, name: 'B型' },
    { id: 4, name: 'O型' },
    { id: 5, name: 'AB型' }
]

include ActiveHash::Associations
  has_many :users
end