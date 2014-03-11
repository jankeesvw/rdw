require "spec_helper"

describe RDW do
  context "given the license plate of a Ferrari" do
    let(:license_plate) { "9KJT45" }
    before { VCR.eject_cassette }
    before { VCR.insert_cassette("ferrari_9KJT45") }
    subject { described_class.car_info_for(license_plate) }

    it { should be_a RDW::CarInfo }
    its("Aantalcilinders") { should eq("12") }
  end

end
