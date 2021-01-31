require 'spec_helper'
require 'rails_helper'
RSpec.describe 'Routing', type: :routing do

  it "routes for root url" do
    expect(get("/")).to route_to("messages#index")
  end

  it "Messages index" do
    expect(get: "/messages").to route_to(controller: 'messages', action: 'index')
  end

  it 'To create messages' do
    expect(post: '/messages').to route_to(controller: 'messages', action: 'create')
  end

  it 'redirect any path to root path' do
    expect(get: '/any_path').to route_to(controller: 'messages', action: 'index', unmatched: "any_path")
  end
end