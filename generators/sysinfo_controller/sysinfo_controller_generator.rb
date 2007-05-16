class SysinfoControllerGenerator < Rails::Generator::NamedBase
  def initialize(runtime_args, runtime_options = {})
    runtime_args << 'sysinfo' if runtime_args.empty?
    super
  end

   def manifest
      record do |m|
        m.class_collisions class_path, "#{class_name}Controller", "#{class_name}ControllerTest"

        # Controller, views, and test directories.
        m.directory File.join('app/controllers', class_path)
        m.directory File.join('app/views', class_path, file_name)
        m.directory File.join('test/functional', class_path)

        # Controller class and functional test class.
        m.template 'controller.rb',
                    File.join('app/controllers',
                              class_path,
                              "#{file_name}_controller.rb")
        m.file 'show.rhtml',
               File.join('app/views',
                         class_path,
                         file_name,
                         'show.rhtml')
        m.file 'show.haml',
               File.join('app/views',
                         class_path,
                         file_name,
                         'show.haml')
        m.template 'functional_test.rb',
                    File.join('test/functional',
                              class_path,
                              "#{file_name}_controller_test.rb")
      end
   end
end
