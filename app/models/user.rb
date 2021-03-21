class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :omniauthable, omniauth_providers:[:twitter]
         
  # def self.find_or_create_from_oauth(auth)
  #   find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
  #     user.provider = auth["provider"]
  #     user.uid      = auth["uid"]
  #     user.name     = auth["info"]["nickname"]
  #     user.email    = User.dummy_email(auth)
  #     user.password = Devise.friendly_token[0, 20]
  #     user.skip_confirmation!
  #   end
  # end
  def self.find_or_create_from_oauth(auth)
    User.find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.provider = auth.provider
      user.name   = auth.info.nickname
      # user.avatar_url = auth.info.image
      user.email      = User.dummy_email(auth)
      user.password   = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end
  def self.from_omniauth(auth)
    find_or_create_by(email: auth.info.email) do |user|
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      # user.remote_icon_url = auth.info.image
      # user.profile = auth.info.description
      user.provider = auth.provider
      user.uid = auth.uid
      user.skip_confirmation!
    end
  end  
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end
  
  private
    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end
end
