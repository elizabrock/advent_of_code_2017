require_relative 'spec_helper'

# http://adventofcode.com/2017/day/4

describe Day4 do
  describe "part1" do
    it "scenario 1" do
      input = "aa bb cc dd ee\naa bb cc dd aa\naa bb cc dd aaa"
      expected = 2
      actual = Day4.part1(input)
      actual.must_equal(expected)
    end
    it "scenario 2" do
      input = <<EOS
sayndz zfxlkl attjtww cti sokkmty brx fhh suelqbp
xmuf znkhaes pggrlp zia znkhaes znkhaes
nti rxr bogebb zdwrin
sryookh unrudn zrkz jxhrdo gctlyz
bssqn wbmdc rigc zketu ketichh enkixg bmdwc stnsdf jnz mqovwg ixgken
flawt cpott xth ucwgg xce jcubx wvl qsysa nlg
EOS
      expected = 5
      actual = Day4.part1(input)
      actual.must_equal(expected)
    end
  end
  describe "valid_passphrase?" do
    it "scenario 1" do
      input = "aa bb cc dd ee"
      expected = true
      actual = Day4.valid_passphrase?(input)
      actual.must_equal(expected)
    end
    it "scenario 2" do
      input = "aa bb cc dd aa"
      expected = false
      actual = Day4.valid_passphrase?(input)
      actual.must_equal(expected)
    end
    it "scenario 3" do
      input = "aa bb cc dd aaa"
      expected = true
      actual = Day4.valid_passphrase?(input)
      actual.must_equal(expected)
    end
  end
  describe "valid_unanagramable_passphrase?" do
    it "scenario 1" do
      input = "abcde fghij"
      expected = true
      actual = Day4.valid_unanagramable_passphrase?(input)
      actual.must_equal(expected)
    end
    it "scenario 2" do
      input = "abcde xyz ecdab"
      expected = false
      actual = Day4.valid_unanagramable_passphrase?(input)
      actual.must_equal(expected)
    end
    it "scenario 1" do
      input = "a ab abc abd abf abj"
      expected = true
      actual = Day4.valid_unanagramable_passphrase?(input)
      actual.must_equal(expected)
    end
    it "scenario 4" do
      input = "iiii oiii ooii oooi oooo "
      expected = true
      actual = Day4.valid_unanagramable_passphrase?(input)
      actual.must_equal(expected)
    end
    it "scenario 5" do
      input = "oiii ioii iioi iiio "
      expected = false
      actual = Day4.valid_unanagramable_passphrase?(input)
      actual.must_equal(expected)
    end
  end
end
