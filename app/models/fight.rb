class Fight < ApplicationRecord
  belongs_to :winner
  belongs_to :looser
end
