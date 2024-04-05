class League < ApplicationRecord
  resourcify

  validates :name, presence: true, uniqueness: true
end
