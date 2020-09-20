class Address < ApplicationRecord
    enum status: { available: "available", in_use: "in_use", completed: "completed" }

    VOTER_NAMES = [
      "Super Voter!",
      "Awesome Voter!",
    ].freeze
end
