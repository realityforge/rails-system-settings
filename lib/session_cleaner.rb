class SessionCleaner
  def self.remove_stale_sessions
    session_timeout = SystemSetting['session.timeout'].to_i
    CGI::Session::ActiveRecordStore::Session.destroy_all( [ 'updated_on < ?', session_timeout.minutes.ago.utc ] )
  end
end
