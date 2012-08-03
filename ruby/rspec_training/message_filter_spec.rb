# -*- coding: utf-8 -*-

require 'rubygems'
require 'rspec'
require './message_filter'

describe MessageFilter do

  before do
    @filter = MessageFilter.new 'foo'
  end

  it 'should detect message with NG word' do
    @filter.detect?('hello from foo').should be_true
  end

  it 'should not detect message with NG word' do
    @filter.detect?('hello, world').should be_false
  end
end
