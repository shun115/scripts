# -*- coding: utf-8 -*-

require 'rubygems'
require 'rspec'
require './message_filter'

describe MessageFilter, "with argument 'foo'" do

  before do
    @filter = MessageFilter.new 'foo'
  end


  it {
    @filter.should be_detect('hello from foo')
  }


  it {
    @filter.should_not be_detect('hello, world')
  }

end
