module EnvironmentCheck
   def self.included(base)
      base.class_eval do
         def self.check_environment
            before_filter do |controller|
               env = SystemSetting['environment']
               raise "Incorrect database '#{env}'; expected '#{RAILS_ENV}'" unless env == RAILS_ENV
            end
         end
      end
   end
end

ActionController::Base.send(:include, EnvironmentCheck)
