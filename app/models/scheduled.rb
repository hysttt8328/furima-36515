class Scheduled < ActiveHash::Base
  self.data = [
    { id: 1, scheduled_id: '--' },
    { id: 2, scheduled_id: '1~2日で発送' },
    { id: 3, scheduled_id: '2~3日で発送' },
    { id: 4, scheduled_id: '4~7日で発送' },
  ]
   include ActiveHash::Associations
   has_many :items
  end