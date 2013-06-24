class Post < ActiveRecord::Base
  attr_accessible :title, :body, :permalink
  attr_protected :param
end