require 'spec_helper.rb'

RSpec.describe GameStats do
    before(:all) do 
        @locations = {games: './data/games_fixture.csv', 
        teams: './data/teams.csv', 
        game_teams: './data/game_teams_fixture.csv'}
        
        @stat_tracker = StatTracker.from_csv(@locations)
    end

    describe "#count_of_games_by_season" do
        it "can count total games in one season" do
            expect(@stat_tracker.count_of_games_by_season).to eq ({"20122013" => 11, "20162017" => 4, "20142015" => 3})
        end

    end

    describe "#average_goals_per_game" do
        it "can determine average goals of all games" do
            expect(@stat_tracker.average_goals_per_game).to eq (4.06) #rounded from 4.0588...
        end
    end

    describe "#average_goals_by_season" do
        it "can determine average goals of all games in a given season" do
            expect(@stat_tracker.average_goals_by_season).to eq ({"20122013" => 3.73, "20162017" => 4.75, "20142015" => 4.33 })
        end
    end

    describe '#highest_total_score' do
        it 'can find the highest sum of winning and losing teams scores' do 
            expect(@stat_tracker.highest_total_score).to eq 5
        end
    end

    describe '#lowest_total_score' do
        it 'can find the lowest sum of winning and losing teams scores' do
            expect(@stat_tracker.lowest_total_score).to eq 1
        end
    end

    describe '#percentage_home_wins' do
        it 'can calculate home team wins percentage' do
            expect(@stat_tracker.percentage_home_wins).to eq (0.44)
        end
    end

    describe '#percentage_visitor_wins' do
        it 'can calculate visitor team wins percentage' do
            expect(@stat_tracker.percentage_visitor_wins).to eq (0.50)
        end
    end

    describe '#percentage_ties' do
        it 'can calculate percentage of tie games' do
            expect(@stat_tracker.percentage_ties).to eq (0.06)
        end
    end

    describe '#away_winners' do
        it 'can count away wins' do
            expect(@stat_tracker.away_winners).to eq 9
        end
    end

    describe '#home_winners' do
        it 'can count home wins' do
            expect(@stat_tracker.home_winners).to eq 8
        end
    end

    describe '#tie_games' do
        it 'can count tie games' do
            expect(@stat_tracker.tie_games).to eq 1
        end
    end

    describe '#all_scores' do 
        it 'can return all combined scores as an array' do
            expect(@stat_tracker.all_scores).to eq([5, 5, 3, 5, 4, 3, 5, 3, 1, 3, 5, 5, 5, 4, 3, 5, 5, 4])
        end
    end

end