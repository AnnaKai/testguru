module User::Auth

  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  included do
    validates :email, presence: true
    validates :password, presence: true, if: Proc.new { |u| u.password.blank? }
    validates :password, confirmation: true
  end

  def authenticate(pass)
    digest(pass) == self.password ? self : false
  end

  def password=(pass)
    if pass.nil?
      self.password = nil
    elsif pass.present?
      @password = pass
      self.password = digest(pass)
    end
  end

  private

  def digest(pass)
    Digest::SHA1.hexdigest(pass)
  end

end
