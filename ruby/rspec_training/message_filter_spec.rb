# -*- coding: utf-8 -*-

require 'rubygems'
require 'rspec'
require './message_filter'

describe MessageFilter do

  it 'should detect message with NG word' do
    filter = MessageFilter.new 'foo'
    filter.detect?('hello from foo').should be_true
  end

end
