class User < ApplicationRecord
  enum role: { basic: "basic", admin: "admin" }

  validates :email, presence: true

  def active?
    !pending?
  end
end
