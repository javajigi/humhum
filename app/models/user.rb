class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :user_picture
  # attr_accessible :title, :body

	def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
		data = access_token.info
		if user = User.where(:email => data.email).first
	    	user
		else # Create a user with a stub password. 
			token = Devise.friendly_token[0,20]
	    	User.create!(:email => data.email, :password => token, :password_confirmation => token, :username => data.name, :user_picture => data.image) 
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
