require './lib/bike.rb'

describe Bike do
  it { is_expected.to respond_to :report_broken }

  it 'checks that the report status of a bike that has been reported broken is set to broken' do
    subject.report_broken
    expect(subject.broken).to eq true
  end
end
