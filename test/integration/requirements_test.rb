require 'test_helper'

class RequirementsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "i see a form at the root path with a drop-down and a button" do
    visit root_path
    assert page.has_xpath? '//form'
    assert page.has_xpath? '//select'
    assert page.has_button? 'Throw!'
  end

  test 'i see a page indicating whether or not i win,lose or tie' do
    visit root_path
    click_button 'Throw!'
    assert page.has_content?("You Lose!") ||
           page.has_content?("You Win!") ||
           page.has_content?("You Tied!")
  end

  test 'i see a new game link after i throw a sign' do
    visit root_path
    click_button 'Throw!'
    assert page.has_link?('New Game')
  end

  test 'when i click the new game link, i begin a new game' do
    visit root_path
    click_button 'Throw!'
    click_link 'New Game'
    assert current_path == root_path
  end

end