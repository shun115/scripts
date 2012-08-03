# -*- coding: utf-8 -*-

require "rubygems"
require "rspec"
require 'bowling'

describe Bowling do

  context "receive valid frame data" do
    subject { Bowling.new '1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6' }

    it { should be_valid }
    its(:total) { should == 133 }
  end

  context "receive valid frame data" do
    subject { Bowling.new '1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,7' }

    it { should be_valid }
    its(:total) { should == 125 }
  end

  context "receive invalid frame data" do
    subject { Bowling.new '1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2' }

    it { should_not be_valid }
  end

  context "receive valid frame data" do
    subject { Bowling.new '0,0,10,8,2,10,10,10,5,3,8,2,10,10,10,10' }
    its('frame.count') { should == 10 }
    it { should be_valid }
    
    its(:total) { should == 201 }
  end

  describe 'frame' do
    subject { Bowling.new throws }

    context '0,0' do
      let(:throws) { '0,0' }
      its('frame.count') { should == 1 }
    end

    context '10,0' do
      let(:throws) { '10,0' }
      its('frame.count') { should == 1 }
    end

    context '10,0,4' do
      let(:throws) { '10,0,4' }
      its('frame.count') { should == 2 }
    end

    context '2,3,0,6' do
      let(:throws) { '2,3,0,6' }
      its('frame.count') { should == 2 }
    end
  end

end
