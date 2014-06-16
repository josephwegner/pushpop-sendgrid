require 'spec_helper'

SPEC_TEMPLATES_DIRECTORY ||= File.expand_path('../', __FILE__)

describe Pushpop::Sendgrid do

  describe '#configure' do

    it 'should set various params' do

      step = Pushpop::Sendgrid.new do
        to 'josh@keen.io'
        from 'depths@hell.com'
        subject 'time is up'
        body 'use code 3:16 for high leniency'
        preview true
      end

      step.configure

      step._to.should == 'josh@keen.io'
      step._from.should == 'depths@hell.com'
      step._subject.should == 'time is up'
      step._body.should == 'use code 3:16 for high leniency'
      step._preview.should == true

    end

  end

  describe '#run' do

    it 'should send some email' do

      Mail.stub(:deliver)

      step = Pushpop::Sendgrid.new do |response|
        to 'josh@keen.io'
        from 'alerts+pushpop@keen.io'
        subject "There were #{response} Pageviews Today!"
        body 'hey wats up'
      end

      step.run(365)

    end

    it 'should not sent email if nothing is configured' do
      Mail.stub(:deliver).never
      step = Pushpop::Sendgrid.new do end
      step.run(365)
    end

  end

  describe '#body' do

    it 'should use a string if given 1 arg' do
      step = Pushpop::Sendgrid.new
      step.body 'hello world'
      step._body.should == 'hello world'
    end

    it 'should use a template if more than 1 arg is passed' do
      step = Pushpop::Sendgrid.new
      step.body('spec.html.erb', 500, {}, SPEC_TEMPLATES_DIRECTORY)
      step._body.strip.should == '<pre>500</pre>'
    end

  end

  describe '#attachment' do

    it 'should attach a file to an email' do
      step = Pushpop::Sendgrid.new
      step.attachment 'huzzah.txt'
      step._attachment.should == 'huzzah.txt'
    end

  end

end
