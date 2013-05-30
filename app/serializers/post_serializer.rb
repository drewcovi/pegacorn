class PostSerializer < BaseSerializer
  attributes :id, :title, :body, :param

  def param
    "#{id}-#{title.dasherize.parameterize}"
  end
end
