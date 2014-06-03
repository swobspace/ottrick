require 'dotenv'

Dotenv.load( File.expand_path(__FILE__ + '/../.localenv'), 
              File.expand_path(__FILE__ + '/../.env'))

RSpec.configure do |config|
end
