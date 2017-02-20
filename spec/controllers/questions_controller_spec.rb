require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:valid_attributes) {
    {
      title: 'foo title',
      description: 'bar description'
    }
  }

  it 'creates a question' do
    expect {
      post :create, params: {
        question: valid_attributes
      }
    }.to change(Question, :count).by 1
  end
end
