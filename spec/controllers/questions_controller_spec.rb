require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:valid_attributes) {
    {
      title: 'foo title',
      description: 'bar description'
    }
  }

  let(:invalid_attributes) {
    {
      title: nil,
      description: nil
    }
  }

  it 'creates a question' do
    expect(Question.all.length).to eq 0
    post :create, params: {
      question: valid_attributes
    }
    expect(Question.all.length).to eq 1
  end
end
