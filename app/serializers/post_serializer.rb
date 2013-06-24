class PostSerializer < BaseSerializer
  attributes :id, :title, :body, :param, :permalink

  def param
    "#{id}-#{title.dasherize.parameterize}"
  end
end
