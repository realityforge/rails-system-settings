desc "Remove stale sessions"
task 'db:sessions:remove_stale' => :environment do
  SessionCleaner::remove_stale_sessions
end
