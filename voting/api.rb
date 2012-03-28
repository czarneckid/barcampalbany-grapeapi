require 'grape'

module Voting
  class API < Grape::API    
    prefix 'api'
    version 'v1'
    format :json
    default_format :json

    resource :status do
      get '/ping' do
        {:status => 'ok', :data => 'pong'}
      end
    end

    resource :voting do
      post '/vote_for/:candidate' do
        {
          :status => 'ok', 
          :data => {
            :candidate => params[:candidate],
            :votes => $redis.hincrby('candidate_votes', params[:candidate], 1)
          }
        }
      end

      post '/unvote_for/:candidate' do
        {
          :status => 'ok', 
          :data => {
            :candidate => params[:candidate],
            :votes => $redis.hincrby('candidate_votes', params[:candidate], -1)
          }
        }
      end
    end
  end
end