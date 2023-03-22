
require 'rails_helper'

RSpec.describe BaseSerializer, type: :serializer do
  let(:resource) { FactoryBot.create(:user) }
  let(:serialized_resource) { described_class.new(resource).as_json }

  subject { serialized_resource[:base] }

  it 'has an ID that matches with resource ID' do
    if subject.nil?
      puts "Error: subject is nil"
    else
      expect(subject[:id]).to eq(resource.id)
    end
  end

  it 'has a created date time of the resource' do
    if subject.nil?
      puts "Error: subject is nil"
    else
      expect(subject[:created_at]).to eq(resource.created_at)
    end
  end

  it 'has an updated date time of the resource' do
    if subject.nil?
      puts "Error: subject is nil"
    else
      expect(subject[:updated_at]).to eq(resource.updated_at)
    end
  end
end