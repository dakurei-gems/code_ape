RSpec.describe CodeApe::Division do
  it "has classes" do
    expect(CodeApe::DIVISIONS[1].classes).not_to be nil
    expect(CodeApe::DIVISIONS[1].classes).not_to eq []
    expect(CodeApe::DIVISIONS[1].classes.size).to eq 7
  end

  it "has groups" do
    expect(CodeApe::DIVISIONS[1].groups).not_to be nil
    expect(CodeApe::DIVISIONS[1].groups).not_to eq []
    expect(CodeApe::DIVISIONS[1].groups.size).to eq 7
  end

  it "has subsection" do
    expect(CodeApe::DIVISIONS[1].subsection).not_to be nil
    expect(CodeApe::DIVISIONS[1].subsection&.label).to eq "Culture et production animale, chasse et services annexes"
  end

  it "has section" do
    expect(CodeApe::DIVISIONS[1].section).not_to be nil
    expect(CodeApe::DIVISIONS[1].section&.label).to eq "Agriculture, sylviculture et pêche"
  end

  it "can be render to hash" do
    expect(CodeApe::DIVISIONS[1].to_h).not_to be nil
    expect(CodeApe::DIVISIONS[1].to_h).not_to eq({})
    expect(CodeApe::DIVISIONS[1].to_h).to eq({label: "Cultures non permanentes"})
  end
end
