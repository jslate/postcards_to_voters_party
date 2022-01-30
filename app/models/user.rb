class User < ApplicationRecord
  enum role: { basic: "basic", admin: "admin" }
end
