load 'part2.rb'

describe "#rps_game_winner" do
    context "fail states" do
        it "should raise when number of players is not two" do
            expect { rps_game_winner([]) }.to raise_error(WrongNumberOfPlayersError)
            expect { rps_game_winner([["Armando", "P"]]) }.to raise_error(WrongNumberOfPlayersError)
            expect { rps_game_winner([["Armando", "P"], ["Dave", "S"], ["Ben", "P"]]) }.to raise_error(WrongNumberOfPlayersError)
        end
        it "should raise when an invalid strategy is given" do
            expect { rps_game_winner([["Armando", "P"], ["Dave", "F"]]) }.to raise_error(NoSuchStrategyError
)
        end
    end
    context "ties" do
        it "should return the first player in case of a tie" do
            p1 = ["Armando", "P"]
            p2 = ["Dave", "P"]
            rps_game_winner([p1, p2]).should eq(p1)
            rps_game_winner([p2, p1]).should eq(p2)
        end
    end
    context "winners" do
        it "should return rock beats scissors" do
            p1 = ["Armando", "R"]
            p2 = ["Dave", "S"]
            rps_game_winner([p1, p2]).should eq(p1)
            rps_game_winner([p2, p1]).should eq(p1)
        end
        it "should return paper beats rock" do
            p1 = ["Armando", "P"]
            p2 = ["Dave", "R"]
            rps_game_winner([p1, p2]).should eq(p1)
            rps_game_winner([p2, p1]).should eq(p1)
        end
        it "should return scissors beats paper" do
            p1 = ["Armando", "S"]
            p2 = ["Dave", "P"]
            rps_game_winner([p1, p2]).should eq(p1)
            rps_game_winner([p2, p1]).should eq(p1)
        end
    end
end

describe "#is_single_round" do
    game = [ ["Armando", "P"], ["Dave", "S"] ]
    tournament = 
    [ 
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ],
    ]
    
    it "should be able to detect a single round game" do
        is_single_round?(game).should be_true
        is_single_round?(tournament).should be_false
    end
end

describe "#rps_tournament_winner" do
    winner = ["Richard", "R"]
    tournament1 = [ winner,  ["Michael", "S"] ]
    tournament4 =
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        tournament1,
    ]
    tournament8 = 
    [
        tournament4,
        [ 
            [ ["Allen", "S"], ["Omer", "P"] ],
            [ ["David E.", "R"], ["Richard X.", "P"] ],
        ],
    ]
    tournament16 = 
    [
        tournament8,
        [
            [
                [ [ "P1", "P" ], [ "P2", "S" ] ],
                [ [ "P3", "R" ] , [ "P4", "P" ] ],
            ],
            [
                [ [ "P7", "P" ], [ "P5", "S" ] ],
                [ [ "P9", "R" ] , [ "P10", "P" ] ],
            ],
        ],
    ]
    
    it "should return the winner" do
        rps_tournament_winner(tournament1)[0].should eq "Richard"
        rps_tournament_winner(tournament4)[0].should eq "Richard"
        rps_tournament_winner(tournament8)[0].should eq "Richard"
        rps_tournament_winner(tournament16)[0].should eq "Richard"
    end
end
