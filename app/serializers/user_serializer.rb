class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :quote, :eye_color
end
