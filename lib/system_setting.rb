class SystemSetting < ActiveRecord::Base
   def self.[](name)
      p = SystemSetting.find_by_name(name)
      p ? p.value : nil
   end

   def self.[]=(name,value)
      p = SystemSetting.find_or_create_by_name(name)
      p.value = value
      p.save!
   end
end
