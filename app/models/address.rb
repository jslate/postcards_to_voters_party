class Address < ApplicationRecord
  belongs_to :campaign
  belongs_to :in_use_user, class_name: 'User'

  enum status: { available: "available", in_use: "in_use", completed: "completed", failed: "failed" }

  VOTER_NAMES = [
    "Important Voter",
    "VIP Voter",
    "Best Voter Ever",
    "Valued Voter",
    "Essential Voter",
    "Esteemed Voter",
    "Much-Needed Voter",
    "Partner in Democracy",
    "Voter Friend",
    "Terrific Voter",
    "Awesome Voter",
    "Patriotic Voter",
    "Concerned Citizen",
    "Defender of Democracy",
    "Super Voter",
    "Serious Voter",
    "Responsible Voter",
    "Winning Voter",
  ].freeze
end
