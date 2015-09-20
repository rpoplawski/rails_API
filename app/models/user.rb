class User < ActiveRecord::Base
  has_many :orders, :through =>  :items
  has_one  :address
end
