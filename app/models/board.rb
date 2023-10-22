class Board < ApplicationRecord
    belongs_to :game
    has_many :tiles
    def end_of_board
        tiles.where(number: tiles.pluck(:number).max).first
    end
end
