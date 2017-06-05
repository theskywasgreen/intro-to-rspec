require './lib/caeser_cipher'

describe "caeser_cipher" do
  it "returns shifted input when shift is not 0" do
    expect(caeser_cipher("what a string", 5)).to eq("bmfy f xywnsl")
  end
  it "returns same input when shift is 0" do
    expect(caeser_cipher("what a string", 0)).to eq("what a string")
  end
  it "returns capitals when capitals are the input" do
    expect(caeser_cipher("WHAT A STRING", 5)).to eq("BMFY F XYWNSL")
  end
  it "does not shift non-alphabet characters" do
    expect(caeser_cipher("what a string!", 5)).to eq("bmfy f xywnsl!")
  end
  it "can shift both upper and lower case letters in the same string" do
    expect(caeser_cipher("What a string!", 5)).to eq("Bmfy f xywnsl!")
  end
  it "can wrap after z" do
    expect(caeser_cipher("xyz", 5)).to eq("cde")
  end
end
