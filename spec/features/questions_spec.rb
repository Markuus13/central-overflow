require 'rails_helper'

RSpec.feature "Questions", type: :feature do
  scenario 'Clicking on "Ask Question" button' do
    visit questions_path
    click_link 'Ask Question'
    expect(current_path).to eq(new_question_path)
  end

  scenario 'Creating a new question' do
    visit new_question_path
    within('#question-form') do
      fill_in 'Title', with: 'Question one?'
      fill_in 'Description', with: 'I really need help in this problem.'
    end
    click_button 'Ask!'
    expect(page).to have_content 'Question created.'
  end

  xfeature 'Viewing questions' do
    let(:title_1) { 'Question 1' }
    let(:title_2) { 'Question 2' }

    background do
      FactoryGirl.create :question, title: title_1
      FactoryGirl.create :question, title: title_2
    end

    scenario 'Viewing created questions' do
      visit questions_path
      expect(page).to have_content(title_1)
      expect(page).to have_content(title_2)
    end
  end
end
