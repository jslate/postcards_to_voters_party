class User < ApplicationRecord
  enum role: { basic: "basic", admin: "admin" }

  def active?
    !pending?
  end
end
