require 'spec_helper'

describe 'bin/slacktail' do
  subject { MisterBin::Runner.new handler: Slacktail::Command }

  context "with --help" do
    it "shows usage" do
      expect{ subject.run %w[slacktail --help] }.to output_approval('bin/help')
    end
  end

  context "with --version" do
    it "shows version" do
      expect{ subject.run %w[slacktail --version] }.to output("#{Slacktail::VERSION}\n").to_stdout
    end
  end
end
