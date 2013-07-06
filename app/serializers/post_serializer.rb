class PostSerializer < BaseSerializer
  attributes :id, :title, :body, :param, :permalink, :updated_at

  def param
    "#{id}-#{title.dasherize.parameterize}"
  end
end
