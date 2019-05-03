class Sold < ActiveHash::Base
  self.data = [
    {id: 0, name: '販売中'},
    {id: 1, name: '売り切れ'},
  ]
end
