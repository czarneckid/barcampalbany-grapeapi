require 'spec_helper'
require 'json'

describe 'Voting::API' do
  def app
    Voting::API
  end
  
  describe '/status/ping' do
    it 'should respond with pong' do
      get '/api/v1/status/ping'
      last_response.should be_ok
      JSON.parse(last_response.body)['data'].should == 'pong'
    end
  end

  describe '/voting/vote_for' do
    it 'should allow me to vote for a given candidate' do
      post '/api/v1/voting/vote_for/david'
      last_response.status.should be(201)

      JSON.parse(last_response.body).tap do |parsed_json|
        parsed_json['data']['votes'].should be(1)
        parsed_json['data']['candidate'].should == 'david'
      end
    end
  end
end