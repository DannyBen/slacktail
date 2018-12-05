require 'spec_helper'

describe 'bin/slacktail-slacktail' do
  subject { CLI.runner }

  context "without arguments" do
    it "shows short usage" do
      expect{ subject.run %w[slacktail]}.to output_fixture('cli/slacktail/usage')
    end
  end

  context "with --help" do
    it "shows long usage" do
      expect{ subject.run %w[slacktail --help] }.to output_fixture('cli/slacktail/help')
    end
  end

  context "with required arguments" do
    # Implement
  end
end
