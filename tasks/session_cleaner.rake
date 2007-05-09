desc "Remove stale sessions"
task 'db:session:remove_stale' => :environment do
  require 'session_cleaner'
  SessionCleaner::remove_stale_sessions
end
