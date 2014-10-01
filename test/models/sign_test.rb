require 'test_helper'

class SignTest < ActiveSupport::TestCase

  test "rock beats scissors" do
    rock = Sign.new :rock
    scissors = Sign.new :scissors
    assert rock.beats?(scissors)
  end

  test "scissors beats paper" do
    scissors = Sign.new :scissors
    paper = Sign.new :paper
    assert scissors.beats?(paper)
  end

  test "paper beats rock" do
    paper = Sign.new :paper
    rock = Sign.new :rock
    assert paper.beats?(rock)
  end

  test "ties are ties" do
    paper = Sign.new :paper
    assert paper.ties?(Sign.new(:paper))
  end

end