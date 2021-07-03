class PreparationDay < ActiveHash::Base 
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1日' },
    { id: 3, name: '2日から4日' },
    { id: 4, name: '1週間' },
  ]

  include ActiveHash::Associations
  has_many :items

  end