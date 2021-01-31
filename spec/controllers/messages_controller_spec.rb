require 'spec_helper'
require 'rails_helper'
RSpec.describe MessagesController, type: :controller do
  describe 'post#create' do

    it 'Root request' do
      get :index
      response.should render_template(:index)
    end

    it 'By the correct params' do
      post :create, params: { first_name: 'Ajack', last_name: 'Cus', message: 'Random message', phone: '91123456789', email: 'ajay12@yopmail.com' }, format: :js
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq 'success'
      expect(json_response['data']['status']).to eq 201
    end

    it 'By the incorrect params' do
      post :create, params: { first_name: 'Ajack', last_name: 'Cus', message: 'Random message', phone: '91123456789', email: 'ajay12@@yopmail.com' }, format: :js
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq 'failed'
    end
  end
end