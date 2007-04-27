class SystemSetting < ActiveRecord::Base
   def self.[](name)
      p = SystemSetting.find_by_name(name)
      p ? p.value : nil
   end

   def self.[]=(name,value)  
      p = SystemSetting.find_by_name(name)
      p = SystemSetting.new(:name => name) unless p 
      p.value = value
      p.save!
   end
end
