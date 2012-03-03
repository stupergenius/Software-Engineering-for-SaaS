class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def is_single_round?(game)
    if (game != nil and game.length == 2 and game[0].length == 2)
        p1 = game[0]
        p2 = game[1]
        return (
            p1 != nil and p2 != nil and
            p1.length == 2 and p2.length == 2 and
            p1[0].kind_of? String and p1[1].kind_of? String and
            p2[0].kind_of? String and p2[1].kind_of? String
        )
    end
    return false
end

def single_round_rps(p1, p2)
    strategy_beats = {"R" => "S", "P" => "R", "S" => "P"}
    raise NoSuchStrategyError unless p1.length == 2 and strategy_beats.has_key? p1[1]
    raise NoSuchStrategyError unless p2.length == 2 and strategy_beats.has_key? p2[1]
    
    p1_strat = p1[1]
    p2_strat = p2[1]
    if p1_strat == p2_strat
        return p1
    elsif strategy_beats[p1_strat] == p2_strat
        return p1
    else
        return p2
    end
end

def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game != nil and game.length == 2
    return single_round_rps game[0], game[1]
end

def rps_tournament_winner(tournament)
    if (is_single_round? tournament)
        return rps_game_winner tournament
    else
        left_winner = rps_tournament_winner tournament[0]
        right_winner = rps_tournament_winner tournament[1]
        return rps_game_winner [left_winner, right_winner]
    end
end
