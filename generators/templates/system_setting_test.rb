require File.dirname(__FILE__) + '/../test_helper'

class SystemSettingTest < Test::Unit::TestCase
   def test_basic_load
      system_setting = system_settings(:p1)
      assert_equal( 1, system_setting.id )
      assert_equal( 'import_date', system_setting.name )
      assert_equal( '6/2/2007 10:00am', system_setting.value )
      assert_equal( true, system_setting.valid? )
   end

   def test_array_read
      assert_equal( '6/2/2007 10:00am', SystemSetting['import_date'] )
   end

   def test_array_write_for_existing
      assert_equal( '6/2/2007 10:00am', SystemSetting['import_date'] )
      SystemSetting['import_date'] = '42'
      assert_equal( '42', SystemSetting['import_date'] )
   end

   def test_array_write_for_new
      assert_nil( SystemSetting['flux capacitor'] )
      SystemSetting['flux capacitor'] = '42'
      assert_equal( '42', SystemSetting['flux capacitor'] )
   end
end
