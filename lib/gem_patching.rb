require 'rubygems'

module Gem
  def self.patching(gem_name, targeted_gem_version, &block)
   active_gem = Gem.loaded_specs[gem_name]
   if active_gem && active_gem.version.to_s != targeted_gem_version
     raise "Attempt to apply patch targeting version '#{targeted_gem_version}' of '#{gem_name}', but active version is '#{active_gem.version}'"
   else
     yield if block_given?
   end
  end
end