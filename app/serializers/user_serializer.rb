class UserSerializer < BaseSerializer
  attributes :id, :email, :param, :first_name, :last_name, :password, :guts_token, :ldap

  def param
    namePortion = email.split('@').first
    "#{id}-#{namePortion.dasherize.parameterize}"
  end
end