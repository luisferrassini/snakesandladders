class Player < ApplicationRecord
    belongs_to :game
    has_many :rolls

    def get_current_tile
        self.reached_end_of_board? ? self.game.board.end_of_board : self.game.board.tiles.where(number: roll_sum).first
    end

    def reached_end_of_board?
        self.roll_sum > self.game.board.end_of_board.number
    end

    def roll_sum
        self.rolls.pluck(:value).reduce(:+).nil? ? 0 : self.rolls.pluck(:value).reduce(:+)
    end

    def roll_dice(dice_sides = 6)
        roll = Roll.new
        roll.value = 1 + rand(dice_sides.to_i)
        self.rolls.push roll
        roll
    end

    def activate_special(value)
        roll = Roll.new
        roll.value = value
        self.rolls.push roll
        roll
    end

    def add_reroll
        self.add_rerolls
    end

    def add_rerolls(value = 1)
        self.rerolls += value
        self.save
    end
end
