require "spec_helper"

describe RDW::CarInfo do

  context "given the license plate of a Ferrari" do
    let(:license_plate) { "9KJT45" }
    before { VCR.eject_cassette }
    before { VCR.insert_cassette("ferrari_9KJT45") }
    subject { described_class.new(license_plate) }

    it { should be_a RDW::CarInfo }

    its("number_of_cylinders") { should eq 12 }
    its("number_of_seats") { should eq 2 }
    its("BPM") { should eq 82168 }
    its("fuel_efficiency_main_road") { should eq 14.70 }
    its("fuel_efficiency_city") { should eq 32.70 }
    its("fuel_efficiency_combined") { should eq 21.30 }
    its("cylinder_capacity") { should eq 5999.0 }
    its("co2_combined") { should eq 490.0 }
    its("color") { should eq "ROOD" }
    its("fuel_type") { should eq "Benzine" }
    its("brand") { should eq "FERRARI" }
    its("energy_label") { should eq "G" }
    its("inspect") { should eq "<RDW::CarInfo license_plate:'9KJT45' brand:'FERRARI' fuel_type:'Benzine'>" }
  end

  context "given the license plate of a New Beetle" do
    let(:license_plate) { "87PVF5" }
    before { VCR.eject_cassette }
    before { VCR.insert_cassette("new_beetle_9KJT45") }
    subject { described_class.new(license_plate) }

    it { should be_a RDW::CarInfo }

    its("number_of_cylinders") { should eq 4 }
    its("number_of_seats") { should eq 4 }
    its("BPM") { should eq 4563 }
    its("fuel_efficiency_main_road") { should eq 0.0 }
    its("fuel_efficiency_city") { should eq 0.0 }
    its("fuel_efficiency_combined") { should eq 0.0 }
    its("cylinder_capacity") { should eq 1595.0 }
    its("co2_combined") { should eq 0.0 }
    its("color") { should eq "GRIJS" }
    its("fuel_type") { should eq "Benzine" }
    its("brand") { should eq "VOLKSWAGEN" }
    its("energy_label") { should eq "" }
    its("inspect") { should eq "<RDW::CarInfo license_plate:'87PVF5' brand:'VOLKSWAGEN' fuel_type:'Benzine'>" }
  end

  context "given the license plate of a T2 bus" do
    let(:license_plate) { "67YA03" }
    before { VCR.eject_cassette }
    before { VCR.insert_cassette("t2_67YA03") }
    subject { described_class.new(license_plate) }

    it { should be_a RDW::CarInfo }

    its("number_of_cylinders") { should eq 4 }
    its("number_of_seats") { should eq 0 }
    its("BPM") { should eq 0 }
    its("fuel_efficiency_main_road") { should eq 0.0 }
    its("fuel_efficiency_city") { should eq 0.0 }
    its("fuel_efficiency_combined") { should eq 0.0 }
    its("cylinder_capacity") { should eq 0 }
    its("co2_combined") { should eq 0.0 }
    its("color") { should eq "BLAUW" }
    its("fuel_type") { should eq "LPG (Liquified Petrol Gas)" }
    its("brand") { should eq "VOLKSWAGEN" }
    its("energy_label") { should eq "" }
    its("inspect") { should eq "<RDW::CarInfo license_plate:'67YA03' brand:'VOLKSWAGEN' fuel_type:'LPG (Liquified Petrol Gas)'>" }
  end

end
