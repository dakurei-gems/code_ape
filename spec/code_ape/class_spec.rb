RSpec.describe CodeApe::Class do
  it "has group" do
    expect(CodeApe::CLASSES[1].group).not_to be nil
    expect(CodeApe::CLASSES[1].group&.label).to eq "Culture de céréales (à l'exception du riz), de légumineuses et de graines oléagineuses"
  end

  it "has division" do
    expect(CodeApe::CLASSES[1].division).not_to be nil
    expect(CodeApe::CLASSES[1].division&.label).to eq "Cultures non permanentes"
  end

  it "has subsection" do
    expect(CodeApe::CLASSES[1].subsection).not_to be nil
    expect(CodeApe::CLASSES[1].subsection&.label).to eq "Culture et production animale, chasse et services annexes"
  end

  it "has section" do
    expect(CodeApe::CLASSES[1].section).not_to be nil
    expect(CodeApe::CLASSES[1].section&.label).to eq "Agriculture, sylviculture et pêche"
  end

  it "can be render to hash" do
    expect(CodeApe::CLASSES[1].to_h).not_to be nil
    expect(CodeApe::CLASSES[1].to_h).not_to eq({})
    expect(CodeApe::CLASSES[1].to_h).to eq({label: "Culture de céréales (à l'exception du riz), de légumineuses et de graines oléagineuses"})
  end
end
