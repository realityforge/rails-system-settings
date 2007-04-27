class SystemSettingsGenerator < Rails::Generator::Base
   def manifest
      record do |m|
         m.directory 'test/fixtures'
         m.directory 'test/unit'
         m.directory 'db/migrate'
         m.template 'system_settings.yml',  File.join('test/fixtures', "system_settings.yml")
         m.template 'system_setting_test.rb',  File.join('test/unit', "system_setting_test.rb")
         m.migration_template 'create_system_settings.rb', 'db/migrate', :migration_file_name => "create_system_settings"
      end
   end
end
