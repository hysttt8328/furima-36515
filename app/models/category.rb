class Category < ActiveHash::Base
  self.data = [
    { id: 1, category_id: '--' },
    { id: 2, category_id: 'メンズ' },
    { id: 3, category_id: 'レディース' },
    { id: 4, category_id: 'ベビー・キッズ' },
    { id: 5, category_id: 'インテリア・住まい・小物' },
    { id: 6, category_id: '本・音楽・ゲーム' },
    { id: 7, category_id: 'おもちゃ・ホビー・グッズ' },
    { id: 8, category_id: '家電・スマホ・カメラ' },
    { id: 9, category_id: 'スポーツ・レジャー' },
    { id: 10, category_id: 'ハンドメイド' },
    { id: 11, category_id: 'その他' },
  ]
   include ActiveHash::Associations
   has_many :items
  end