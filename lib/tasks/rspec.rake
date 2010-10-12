begin
  require 'rspec/core'
  require 'rspec/core/rake_task'
rescue MissingSourceFile
  module RSpec
    module Core
      class RakeTask
        def initialize(name)
          task name do
            # if rspec-rails is a configured gem, this will output helpful material and exit ...
            require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

            # ... otherwise, do this:
            raise <<-MSG

#{"*" * 80}
*  You are trying to run an rspec rake task defined in
*  #{__FILE__},
*  but rspec can not be found in vendor/gems, vendor/plugins or system gems.
#{"*" * 80}
MSG
          end
        end
      end
    end
  end
end

spec_prereq = Rails.root.join('config', 'database.yml').exist? ? "db:test:prepare" : :noop
task :noop do
end

task :stats => "spec:statsetup"

#desc "Run all specs in spec directory (excluding plugin specs)"
#RSpec::Core::RakeTask.new(:spec => spec_prereq)
