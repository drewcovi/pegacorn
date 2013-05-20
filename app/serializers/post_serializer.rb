class PostSerializer < BaseSerializer
  attributes :id, :title, :param # prev code

  def param
    "#{id}-#{title.dasherize.parameterize}"
  end
end
