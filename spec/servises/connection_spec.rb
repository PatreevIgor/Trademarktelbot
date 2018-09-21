# frozen_string_literal: true

require 'rails_helper'

describe Connection do
  subject { described_class }

  describe '.send_json_request' do
    let(:url) { Constant::LAST_50_SALES_URL }

    it 'returns non-empty value' do
      expect(subject.send_json_request(url)).not_to be_empty
    end
  end

  describe '.send_post_request' do
    class Order
      def self.class_id
        '2415361200'
      end

      def self.instance_id
        '57949762'
      end
    end

    let(:url) do
      format(Constant::MASS_INFO_URL, sell: 0, buy: 2, history: 0, info: 0,
                                      api_market_key: Rails.application.secrets.api_market_key)
    end

    it 'returns true' do
      expect(subject.send_post_request(url, Order)['success']).to eq(true)
    end
  end
end
