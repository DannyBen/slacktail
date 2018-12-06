require 'spec_helper'

describe 'bin/slacktail' do
  subject { MisterBin::Runner.new handler: Slacktail::Command }

  context "with --help" do
    it "shows usage" do
      expect{ subject.run %w[slacktail --help] }.to output_fixture('bin/help')
    end
  end

  # context "on exception" do
  #   it "errors gracefuly" do
  #     expect(`bin/slacktail command that errors 2>&1`).to match_fixture('bin/exception')
  #   end
  # end
end
