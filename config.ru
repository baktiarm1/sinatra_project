require './config/environment'
require './app/controllers/application_controller'
require './app/controllers/journal_controller'



if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use JournalController
run ApplicationController
