class User < ActiveRecord::Base
  include BCrypt
  attr_accessor :password_confirmation

  validates :password_confirmation, length: { minimum: 8 }
  validates_confirmation_of :password, :confirm => :password_confirmation
  validates :username, uniqueness: true

  def password_confirmation_matches
    unless password_confirmation == self.password
      errors.add(:password_confirmation, "must match password")
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
