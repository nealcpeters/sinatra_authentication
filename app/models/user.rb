class User < ActiveRecord::Base

  def self.authenticate(email, password)
    user = User.where(email: email, password_hash: password).first
  end
  
end
