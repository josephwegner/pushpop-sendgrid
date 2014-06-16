$: << File.join(File.dirname(__FILE__), '../lib')

require 'pushpop'
require 'pushpop-sendgrid'

RSpec.configure do |config|
  config.before :each do
    Pushpop.jobs.clear
  end
end

