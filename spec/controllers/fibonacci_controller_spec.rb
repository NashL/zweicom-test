#spec/controllers/fibonacci_controller_spec.rb
require "spec_helper"

describe Api::V1::FibonacciController , :type => :api do
  context 'check fibonacci returned values'
    it 'returns the right value for 10' do
      get "api/v1/fibonacci/10"
      expect(json['data']).to eq 55
    end

    it 'returns the right value for 15' do
      get "api/v1/fibonacci/15"
      expect(json['data']).to eq 610
    end

    it 'returns the right value for 20' do
      get "api/v1/fibonacci/20"
      expect(json['data']).to eq 6765
    end
  context 'negative values passed as parameters'
    it 'returns message that only positive numbers are accepted' do
      get 'api/v1/fibonacci/-1'
      expect(json['data']).to eq 'Only positive values accepted'
    end

  context 'random string values as parameters'
  it 'returns 0' do
    get 'api/v1/fibonacci/;()*&'
    expect(json['data']).to eq 0
  end

  it 'returns 0' do
    get 'api/v1/fibonacci/@#dasjk34'
    expect(json['data']).to eq 0
  end

  context 'wrong path'
    it 'returns RoutingError for wrong path' do
      expect{get 'api/v1/fibonacci/number/10'}.to raise_error(ActionController::RoutingError)
    end

end