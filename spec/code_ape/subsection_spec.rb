RSpec.describe CodeApe::Subsection do
  it "has classes" do
    expect(CodeApe::SUBSECTIONS[1].classes).not_to be nil
    expect(CodeApe::SUBSECTIONS[1].classes).not_to eq []
    expect(CodeApe::SUBSECTIONS[1].classes.size).to eq 31
  end

  it "has groups" do
    expect(CodeApe::SUBSECTIONS[1].groups).not_to be nil
    expect(CodeApe::SUBSECTIONS[1].groups).not_to eq []
    expect(CodeApe::SUBSECTIONS[1].groups.size).to eq 31
  end

  it "has divisions" do
    expect(CodeApe::SUBSECTIONS[1].divisions).not_to be nil
    expect(CodeApe::SUBSECTIONS[1].divisions).not_to eq []
    expect(CodeApe::SUBSECTIONS[1].divisions.size).to eq 7
  end

  it "has section" do
    expect(CodeApe::SUBSECTIONS[1].section).not_to be nil
    expect(CodeApe::SUBSECTIONS[1].section&.label).to eq "Agriculture, sylviculture et pêche"
  end

  it "can be render to hash" do
    expect(CodeApe::SUBSECTIONS[1].to_h).not_to be nil
    expect(CodeApe::SUBSECTIONS[1].to_h).not_to eq({})
    expect(CodeApe::SUBSECTIONS[1].to_h).to eq({label: "Culture et production animale, chasse et services annexes"})
  end
end
