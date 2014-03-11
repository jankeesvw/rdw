require "spec_helper"

describe RDW do
  subject { described_class.car_info_for("9KJT45") }

  it { should be_a RDW::CarInfo }
end
