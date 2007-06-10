class SystemSetting < ActiveRecord::Base
  validates_length_of :name, :in => 1..255
  validates_uniqueness_of :name

  def self.[](name)
    p = SystemSetting.find_by_name(name)
    p ? p.value : nil
  end

  def self.[]=(name, value)
    p = SystemSetting.find_by_name(name)
    p = SystemSetting.new(:name => name) unless p
    p.value = value
    p.save!
  end
end
