class Tile < ApplicationRecord
    belongs_to :board
    has_many :players
end
