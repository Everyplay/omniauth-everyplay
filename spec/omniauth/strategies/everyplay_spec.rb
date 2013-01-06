require 'spec_helper'

describe "OmniAuth::Strategies::Everyplay" do
  subject do
    OmniAuth::Strategies::Everyplay.new(nil, @options || {})
  end

  context 'client options' do
    it 'has correct Everyplay site' do
      subject.options.client_options.site.should eq('https://api.everyplay.com')
    end


    it 'has correct access token path' do
      subject.options.client_options.token_url.should eq('/oauth2/access_token')
    end

    it 'has correct authorize url' do
      subject.options.client_options.authorize_url.should eq('https://everyplay.com/connect')
    end
  end

  context '#uid' do
    before :each do
      subject.stub(:raw_info) { { 'id' => '1' } }
    end

    it 'returns the id from raw_info' do
      subject.uid.should eq('1')
    end
  end
end