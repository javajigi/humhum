class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :user_picture, :authentication_token, :identifier
  # attr_accessible :title, :body

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
                                   
  has_many :followers, through: :reverse_relationships, source: :follower

  has_many :musics

	def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
		data = access_token.info
		if user = User.where(:email => data.email).first
      user.update_attributes(:email => data.email, :username => data.name, :user_picture => data.image, :authentication_token => access_token.credentials.token, :identifier => access_token.uid )
      user
		else # Create a user with a stub password. 
    token = Devise.friendly_token[0,20]
	    User.create!(:email => data.email, :password => token, :password_confirmation => token, :username => data.name, :user_picture => data.image, :authentication_token => access_token.credentials.token, :identifier => access_token.uid ) 
		end
	end

	def self.new_with_session(params, session)
		super.tap do |user|
    		if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
    			user.email = data["email"]
    		end
    	end
	end

end
