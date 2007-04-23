class SystemSettingsGenerator < Rails::Generator::NamedBase
   def initialize(runtime_args, runtime_options = {})
      runtime_args << 'create_system_settings' if runtime_args.empty?
      super
   end

   def manifest
      record do |m|
         m.directory File.join('test/fixtures', class_path)
         m.template 'system_settings.yml',  File.join('test/fixtures', "system_settings.yml")
         m.template 'system_setting_test.rb',  File.join('test/unit', "system_setting_test.rb")
         m.migration_template 'migration.rb', 'db/migrate', :assigns => {
             :migration_name => "CreateSystemSettings"
           }, :migration_file_name => "create_system_settings"
      end
   end
end
