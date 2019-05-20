class ShippingMethod < ActiveHash::Base
  self.data = [
    {id: 1, name: '未定', shipping_fee_category: 1},
    {id: 2, name: 'らくらくメルカリ便', shipping_fee_category: 1},
    {id: 3, name: 'ゆうメール', shipping_fee_category: 1},
    {id: 4, name: 'レターパック', shipping_fee_category: 1},
    {id: 5, name: '普通郵便(定形、定形外)', shipping_fee_category: 1},
    {id: 6, name: 'クロネコヤマト', shipping_fee_category: 1},
    {id: 7, name: 'ゆうパック', shipping_fee_category: 1},
    {id: 8, name: 'クリックポスト', shipping_fee_category: 1},
    {id: 9, name: 'ゆうパケット', shipping_fee_category: 1},
    {id: 10, name: '未定', shipping_fee_category: 2},
    {id: 11, name: 'クロネコヤマト', shipping_fee_category: 2},
    {id: 12, name: 'ゆうパック', shipping_fee_category: 2},
    {id: 13, name: 'ゆうメール', shipping_fee_category: 2}
  ]
end
