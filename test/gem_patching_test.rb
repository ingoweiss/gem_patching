require File.expand_path('../test_helper', __FILE__)

class GemPatchingTest < Test::Unit::TestCase

  def setup
    spec = stub(:version => '1.2.9')
    Gem.stubs('loaded_specs').returns({'rspec' => spec})
    @some_object = mock()
  end

  def test_should_run_code_if_gem_version_matches
    @some_object.expects('some_method')
    Gem.patching('rspec', '1.2.9') do
      @some_object.some_method
    end
  end
  
  def test_should_not_run_code_but_raise_exception_if_gem_version_does_not_match
    @some_object.expects('some_method').never
    assert_raise RuntimeError do
      Gem.patching('rspec', '1.2.10') do
        @some_object.some_method
      end
    end
  end
  
  def test_should_not_run_code_if_gem_not_present
    Gem.stubs('loaded_specs').returns({})
    @some_object.expects('some_method').never
    Gem.patching('rspec', '1.2.10') do
      @some_object.some_method
    end
  end

end