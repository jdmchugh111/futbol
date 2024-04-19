require 'spec_helper.rb'

RSpec.describe LeagueStats do
  before(:each) do
    @game_path = './data/games_fixture.csv'
    @team_path = './data/teams.csv'
    @game_teams_path = './data/game_teams_fixture.csv'
    @locations = {
      games: @game_path,
      teams: @team_path,
      game_teams: @game_teams_path
    }
    @stat_tracker = StatTracker.from_csv(@locations)
  end

  it "#count_of_teams" do
    expect(@stat_tracker.count_of_teams).to eq 32
  end

  it "#total_points" do
    expect(@stat_tracker.total_points("3")).to eq 8
    expect(@stat_tracker.total_points("6")).to eq 24
    expect(@stat_tracker.total_points("5")).to eq 2
    expect(@stat_tracker.total_points("17")).to eq 1
    expect(@stat_tracker.total_points("16")).to eq 9
  end

  it "#total_games" do
    expect(@stat_tracker.total_games("3")).to eq 5
    expect(@stat_tracker.total_games("6")).to eq 9
    expect(@stat_tracker.total_games("5")).to eq 4
    expect(@stat_tracker.total_games("17")).to eq 1
    expect(@stat_tracker.total_games("16")).to eq 4
  end

  it "#average_game_points" do
    expect(@stat_tracker.average_game_points("3")).to eq 1.6
    expect(@stat_tracker.average_game_points("6")).to eq 2.67
    expect(@stat_tracker.average_game_points("5")).to eq 0.5
    expect(@stat_tracker.average_game_points("17")).to eq 1.0
    expect(@stat_tracker.average_game_points("16")).to eq 2.25
  end

  it "#average_game_points" do
    expect(@stat_tracker.team_averages_list).to eq ({"DC United"=>2.0, 
    "FC Dallas"=>2.67, 
    "Houston Dynamo"=>1.6, 
    "LA Galaxy"=>1.0, 
    "New England Revolution"=>2.25, 
    "New York City FC" => 2.0,
    "New York Red Bulls"=>2.0, 
    "Real Salt Lake"=>3.0, 
    "Sporting Kansas City"=>0.5, 
    "Toronto FC"=>1.75})
  end

  it "#best_offense" do
    expect(@stat_tracker.best_offense).to eq "Real Salt Lake"
  end

  it "#worst_offense" do
    expect(@stat_tracker.worst_offense).to eq "Sporting Kansas City"
  end

  it "#team_id_to_name" do
    expect(@stat_tracker.team_id_to_name("3")).to eq "Houston Dynamo"
    expect(@stat_tracker.team_id_to_name("6")).to eq "FC Dallas"
    expect(@stat_tracker.team_id_to_name("5")).to eq "Sporting Kansas City"
    expect(@stat_tracker.team_id_to_name("17")).to eq "LA Galaxy"
    expect(@stat_tracker.team_id_to_name("16")).to eq "New England Revolution"
  end

  it "#away_game_count" do
    expect(@stat_tracker.away_game_count("3")).to eq 3
    expect(@stat_tracker.away_game_count("6")).to eq 4
    expect(@stat_tracker.away_game_count("5")).to eq 2
    expect(@stat_tracker.away_game_count("17")).to eq 1
    expect(@stat_tracker.away_game_count("16")).to eq 02
  end
  
  it "#visitor_team_scores" do
  expect(@stat_tracker.visitor_team_scores).to eq({"14"=>3, "16"=>5, "17"=>1, "20"=>4, "24"=>6, "3"=>5, "5"=>1, "6"=>12, "9"=>2})
  end

  it "visitor_averages" do
    expect(@stat_tracker.visitor_averages).to eq({"14"=>3.0, "16"=>2.5, "17"=>1.0, "20"=>2.0, "24"=>3.0, "3"=>1.67, "5"=>0.5, "6"=>3.0, "9"=>2.0})
  end

  it "#highest_scoring_visitor" do
    expect(@stat_tracker.highest_scoring_visitor).to eq "FC Dallas"
  end
  
  it "#home_game_count" do
    expect(@stat_tracker.home_game_count("3")).to eq 2
    expect(@stat_tracker.home_game_count("6")).to eq 5
    expect(@stat_tracker.home_game_count("5")).to eq 2
    expect(@stat_tracker.home_game_count("17")).to eq 0
    expect(@stat_tracker.home_game_count("16")).to eq 2
end

  it "#home_team_scores" do
    expect(@stat_tracker.home_team_scores).to eq({"14"=>3, "16"=>4, "20"=>3, "24"=>6, "3"=>3, "5"=>1, "6"=>12, "8"=>2})
  end

  it "home_averages" do
    expect(@stat_tracker.home_averages).to eq({"14"=>1.5, "16"=>2.0, "20"=>1.5, "24"=>3.0, "3"=>1.5, "5"=>0.5, "6"=>2.4, "8"=>2.0})
  end

  it "#highest_scoring_home_team" do
    expect(@stat_tracker.highest_scoring_home_team).to eq "Real Salt Lake"
  end

  it "#lowest_scoring_visitor" do
    expect(@stat_tracker.lowest_scoring_visitor).to eq "Sporting Kansas City"
  end

  it "#lowest_scoring_home_team" do
    expect(@stat_tracker.lowest_scoring_home_team).to eq "Sporting Kansas City"
  end
end
