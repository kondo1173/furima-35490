class ScheduledDelivery < ActiveHash::Base
  self.data = [
    { id: 1, data: '--' },
    { id: 2, data: '1~2日で発送' },
    { id: 3, data: '2~3日で発送' },
    { id: 4, data: '4~7日で発送' }

  ]
 
   include ActiveHash::Associations
   has_many :items
     
  end