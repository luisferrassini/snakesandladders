class Game < ApplicationRecord
    has_one :board
    has_many :players
end
