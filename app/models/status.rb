class Status < ActiveHash::Base
  self.data = [
    { id: 1, status_id: '--' },
    { id: 2, status_id: '新品・未使用' },
    { id: 3, status_id: '未使用に近い' },
    { id: 4, status_id: '目立った傷や汚れなし' },
    { id: 5, status_id: 'やや傷や汚れあり' },
    { id: 6, status_id: '傷や汚れあり' },
    { id: 7, status_id: '全体的に状態が悪い' },

  ]
   include ActiveHash::Associations
   has_many :items
  end