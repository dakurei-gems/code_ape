RSpec.describe CodeApe::Section do
  it "has classes" do
    expect(CodeApe::SECTIONS[0].classes).not_to be nil
    expect(CodeApe::SECTIONS[0].classes).not_to eq []
    expect(CodeApe::SECTIONS[0].classes.size).to eq 39
  end

  it "has groups" do
    expect(CodeApe::SECTIONS[0].groups).not_to be nil
    expect(CodeApe::SECTIONS[0].groups).not_to eq []
    expect(CodeApe::SECTIONS[0].groups.size).to eq 39
  end

  it "has divisions" do
    expect(CodeApe::SECTIONS[0].divisions).not_to be nil
    expect(CodeApe::SECTIONS[0].divisions).not_to eq []
    expect(CodeApe::SECTIONS[0].divisions.size).to eq 13
  end

  it "has subsections" do
    expect(CodeApe::SECTIONS[0].subsections).not_to be nil
    expect(CodeApe::SECTIONS[0].subsections).not_to eq []
    expect(CodeApe::SECTIONS[0].subsections.size).to eq 3
  end

  it "can be render to hash" do
    expect(CodeApe::SECTIONS[0].to_h).not_to be nil
    expect(CodeApe::SECTIONS[0].to_h).not_to eq({})
    expect(CodeApe::SECTIONS[0].to_h).to eq({label: "Agriculture, sylviculture et pêche"})
  end
end
