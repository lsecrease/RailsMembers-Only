class User < ApplicationRecord
 
 before_create :create_remember_digest
 
 has_secure_password
 
 
  def create_remember_digest
    self.remember_digest = SecureRandom.urlsafe_base64
    update_attribute(:remember_digest, Digest::SHA1.hexdigest(remember_digest.to_s))
  end
end
