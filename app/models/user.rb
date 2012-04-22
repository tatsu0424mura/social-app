class User < ActiveRecord::Base
  attr_protected :email, :name, :provider, :uid
end
