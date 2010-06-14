require File.expand_path('../test_helper', __FILE__)

class GemPatchingTest < Test::Unit::TestCase

  def setup
    mock_spec = mock()
    mock_spec.stubs('version').returns('1.2.9')
    Gem.stubs('loaded_specs').returns({'rspec' => mock_spec})
  end

  def test_should_run_code_if_gem_version_matches
    mock_object = mock()
    mock_object.expects('some_method')
    Gem.patching('rspec', '1.2.9') do
      mock_object.some_method
    end
  end

  def test_should_not_run_code_if_gem_version_does_not_match
    mock_object = mock()
    mock_object.expects('some_method').never
    assert_raise RuntimeError do
      Gem.patching('rspec', '1.2.10') do
        mock_object.some_method
      end
    end
  end

end