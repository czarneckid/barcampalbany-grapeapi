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
      JSON.parse(last_response.body).tap do |parsed_json|
        parsed_json['data'].should == 'pong'
      end
    end
  end

  describe '/voting' do
    describe '#vote_for/:candidate' do
      it 'should allow me to vote for a given candidate' do
        put '/api/v1/voting/vote_for/david'
        last_response.should be_ok

        JSON.parse(last_response.body).tap do |parsed_json|
          parsed_json['data']['votes'].should be(1)
          parsed_json['data']['candidate'].should == 'david'
        end
      end
    end

    describe '#unvote_for/:candidate' do
      it 'should allow me to rescind my vote for a given candidate' do
        put '/api/v1/voting/vote_for/david'
        last_response.should be_ok

        put '/api/v1/voting/unvote_for/david'
        last_response.should be_ok

        JSON.parse(last_response.body).tap do |parsed_json|
          parsed_json['data']['votes'].should be(0)
          parsed_json['data']['candidate'].should == 'david'
        end
      end
    end

    describe '#votes' do
      it 'should allow me to get a list of all the candidates and their vote counts' do
        1.upto(3) do
          put '/api/v1/voting/vote_for/david'
          last_response.should be_ok
        end

        put '/api/v1/voting/vote_for/matthew'
        last_response.should be_ok

        get '/api/v1/voting/votes'
        last_response.should be_ok

        JSON.parse(last_response.body).tap do |parsed_json|
          parsed_json['status'].should == 'ok'
          parsed_json['data']['david'].should == '3'
          parsed_json['data']['matthew'].should == '1'
        end
      end
    end
  end
end