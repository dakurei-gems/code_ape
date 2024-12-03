RSpec.describe CodeApe do
  it "has a version number" do
    expect(CodeApe::VERSION).not_to be nil
  end

  it "can search section" do
    expect(CodeApe.section("A")).not_to be nil
    expect(CodeApe.section("A")&.label).to eq "Agriculture, sylviculture et pêche"
  end

  it "can search subsection" do
    expect(CodeApe.ape("58")).not_to be nil
    expect(CodeApe.ape("58")&.label).to eq "Édition"
  end

  it "can search division" do
    expect(CodeApe.ape("582")).not_to be nil
    expect(CodeApe.ape("582")&.label).to eq "Édition de logiciels"
  end

  it "can search group" do
    expect(CodeApe.ape("5829")).not_to be nil
    expect(CodeApe.ape("5829")&.label).to eq "Édition d'autres logiciels"
  end

  it "can search class" do
    expect(CodeApe.ape("5829C")).not_to be nil
    expect(CodeApe.ape("5829C")&.label).to eq "Édition de logiciels applicatifs"
  end
end
