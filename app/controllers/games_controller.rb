class GamesController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        @games = Game.all
        render :index
    end

    def show
        @game = Game.find(params[:game_id])
        @player_tiles = @game.players.map{ |player| { name: player.name, tile: player.get_current_tile } }
        @rolls = []
        @game.players.each do |player|
            player.rolls.order(created_at: :desc).each do |roll|
                @rolls.push roll unless roll.special
            end
        end
        @rolls = @rolls.slice(0, 5)
        render :show
    end

    def setup
        new_game = Game.new

        new_game.players = []
        params[:players].each do |player|
            new_player = Player.new
            new_player.name = player[:name]
            new_player.rolls = []
            new_player.rerolls = player[:rerolls] unless player[:rerolls].nil?
            new_player.save
            new_game.players.push new_player
        end

        new_game.board = Board.new
        new_game.board.title = params[:board][:title]
        new_game.board.tiles = []
        params[:board][:tiles].each do |tile|
            new_tile = Tile.new
            new_tile.number = tile[:number]
            new_tile.description = tile[:description]
            new_tile.special_value = tile[:special_value] unless tile[:special_value].nil?
            new_tile.save
            new_game.board.tiles.push new_tile
        end

        new_game.save

        render json: new_game
    rescue StandardError => e
        binding.pry if Rails.env.development?
        render json: {
            message: e.message
        }, status: 500
    end

    def roll
        player = Player.find(params[:player_id])
        if player.reached_end_of_board?
            return render json: {
                message: "Invalid roll because player #{player.name} is already at the end of the board (tile #{player.get_current_tile.number}).",
                current_tile: "Tile #{player.get_current_tile.number}: #{player.get_current_tile.description}"
            }
        end

        roll = player.roll_dice(params[:dice_sides])

        unless player.get_current_tile.special_value.zero?
            special_tile = player.get_current_tile
            player.activate_special(player.get_current_tile.special_value)
            return render json: { message: "Player #{player.name} rolled a #{roll.value} and landed on a special tile. Tile #{special_tile.number}: #{special_tile.description} and it's now on tile #{player.get_current_tile.number}",
                                  current_tile: "Tile #{player.get_current_tile.number}: #{player.get_current_tile.description}" }
        end

        render json: { message: "Player #{player.name} rolled a #{roll.value} and it's now on tile #{player.get_current_tile.number}",
                       current_tile: "Tile #{player.get_current_tile.number}: #{player.get_current_tile.description}" }
    rescue StandardError => e
        binding.pry if Rails.env.development?
        render json: {
            message: e.message
        }, status: 500
    end

    def reroll
        player = Player.find(params[:player_id])

        if player.rerolls.zero?
            return render json: {
                message: "Invalid reroll because player #{player.name} doesn't have any rerolls.",
                current_tile: "Tile #{player.get_current_tile.number}: #{player.get_current_tile.description}"
            }
        end

        player.rolls.last.delete
        player.rerolls -= 1
        player.save

        roll = player.roll_dice(params[:dice_sides])

        unless player.get_current_tile.special_value.zero?
            special_tile = player.get_current_tile
            player.activate_special(player.get_current_tile.special_value)
            return render json: { message: "Player #{player.name} used one of their #{player.rerolls + 1} available rerolls and rolled a #{roll.value} and landed on a special tile. Tile #{special_tile.number}: #{special_tile.description} and it's now on tile #{player.get_current_tile.number}",
                                  current_tile: "Tile #{player.get_current_tile.number}: #{player.get_current_tile.description}" }
        end

        render json: { message: "Player #{player.name} used one of their #{player.rerolls + 1} available rerolls and rolled a #{roll.value} and it's now on tile #{player.get_current_tile.number}",
                       current_tile: "Tile #{player.get_current_tile.number}: #{player.get_current_tile.description}" }
    rescue StandardError => e
        binding.pry if Rails.env.development?
        render json: {
            message: e.message
        }, status: 500
    end
end
