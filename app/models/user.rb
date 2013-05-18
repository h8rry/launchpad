class User < ActiveRecord::Base
  attr_accessible :email, :id, :name, :type, :type_id
end
