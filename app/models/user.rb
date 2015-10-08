class User < ActiveRecord::Base
	  validates :username, presence: true, 
	                       uniqueness: true
	  validates :email,    presence: true,
	                       uniqueness: true,
	                       format: { :with => /\w+@\w+\.\w+/ }
	  validates :password_hash, presence: true,
						             length: { minimum: 6 }

  	include BCrypt

  	def password
    	@password ||= Password.new(password_hash)
  	end

  	def password=(new_password)
    	@password = Password.create(new_password)
    	self.password_hash = @password
 	  end

    def self.authenticate(username, password)
      user = User.find_by(username: username)
      user if user && user.password == password
    end

    def self.search(query)
      where("username like ? OR email like ?", "%#{query}%", "%#{query}%")
    end

end
