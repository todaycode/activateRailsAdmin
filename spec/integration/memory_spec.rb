require 'spec_helper'

# These tests show the memory leak that is currently in Active Admin. They
# are all marked as pending until they pass. To work on them, comment out the
# pending method call in #it_should_not_leak
describe "Memory Leak" do

  def count_instances_of(klass)
    count = 0

    ObjectSpace.each_object do |o|
      if o.class == klass
        count += 1
      end
    end

    count
  end

  def self.it_should_not_leak(klass)
    it "should not leak #{klass}" do
<<<<<<< HEAD
      pending

=======
      previously_disabled = GC.enable # returns true if the garbage collector was disabled
>>>>>>> 9d2dc18a (improve test perf by deferring garbage collection)
      GC.start
      count = count_instances_of(klass)

      load_defaults!

      GC.start
      GC.disable if previously_disabled
      count_instances_of(klass).should <= count
    end
  end

  it_should_not_leak ActiveAdmin::Namespace
  it_should_not_leak ActiveAdmin::Resource

end
