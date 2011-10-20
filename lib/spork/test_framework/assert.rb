require 'assert'
class Spork::TestFramework::Assert < Spork::TestFramework
  DEFAULT_PORT = 8988
  HELPER_FILE = File.join(Dir.pwd, "test/test_helper.rb")

  def run_tests(argv, stderr, stdout)
    stdout.puts "[spork-assert] Loading tests matching '#{argv.first}' "
    require_tests argv.first

    stdout.puts '[spork-assert] Running tests'
    view = ::Assert::View::DefaultView.new(stdout)
    ::Assert.runner.new(::Assert.suite, view).run

    stdout.puts '[spork-assert] Done.'
  end

  def require_tests(test_task)
    test_task ||= 'test'
    components = test_task.split ':'
    as_path = File.join(components)
    if File.directory? as_path
      Dir[File.join(components, '**', '*_test.rb')].each do |path|
        require path
      end
    else
      require "#{as_path}_test.rb"
    end
  end
end
