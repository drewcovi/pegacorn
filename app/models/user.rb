class User < ActiveRecord::Base
  attr_accessible :age, :first_name, :last_name, :quote, :eye_color
end