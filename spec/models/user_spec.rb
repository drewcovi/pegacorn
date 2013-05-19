require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"
  it { should validate_presence_of :email }
end
