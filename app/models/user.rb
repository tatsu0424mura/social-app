class User < ActiveRecord::Base

  has_and_belongs_to_many :networks
  attr_protected :email, :name, :provider, :uid

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['name'] || ""
        user.image = auth['info']['image'] || ""
      end
    end
  end
end
