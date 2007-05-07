module DbVersion
  def self.included(base)
    base.class_eval do
      helper_method :db_version

      protected

      def db_version
        DbVersion.db_version
      end

    end
  end

  def self.db_version
    mv = DbVersion.minor_version
    sv = DbVersion.schema_version
    mv.nil? ? sv : "#{sv}.#{mv}"
  end

  def self.minor_version
    SystemSetting['minor.version']
  end

  def self.schema_version
    (ActiveRecord::Base.connection.select_one("SELECT version FROM schema_info") || {"version" => 0})["version"]
  end
end

ActionController::Base.send(:include, DbVersion)
