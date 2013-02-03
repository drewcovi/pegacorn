class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :eye_color, :quote
end
