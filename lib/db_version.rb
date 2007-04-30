module DbVersion
  def self.included(base)
    base.class_eval do
      helper_method :db_version
      
      protected
      
      def db_version  
        mv = SystemSetting['minor.version']
        sv = schema_version
        mv.nil? ? sv : "#{sv}.#{mv}"
      end

      def schema_version
        (ActiveRecord::Base.connection.select_one("SELECT version FROM schema_info") || {"version" => 0})["version"]
      end
    end
  end
end

ActionController::Base.send(:include, DbVersion)
