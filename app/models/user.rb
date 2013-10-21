class User < ActiveRecord::Base
  attr_accessible :address, :city, :first_name, :is_admin, :last_name, :state, :zip
end
