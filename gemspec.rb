require "rubygems"
Gem::manage_gems
require "rake/gempackagetask"

spec = Gem::Specification::new do |s|
  s.name = "ruby-poker"
  s.summary = "Ruby library for determining the winner in a game of poker." 
  s.version = "0.1.1" 
  
  s.rubyforge_project = "rubypoker"
  s.platform = Gem::Platform::RUBY 
  
  s.autorequire = "rubypoker"
  
  s.files = FileList["lib/*.rb"]
  s.require_path = "lib" 

  s.has_rdoc = File::exist? "docs" 
  s.extra_rdoc_files = ["README", "CHANGELOG", "LICENSE"]
  
  s.test_files = Dir.glob("test/*.rb")

  s.author = "Robert Olson"
  s.email = "rko618@gmail.com"
  s.homepage = "http://rubyforge.org/projects/rubypoker/"
end


Rake::GemPackageTask.new(spec) do |pkg| 
  pkg.need_tar = true 
end

task :default => "pkg/#{spec.name}-#{spec.version}.gem" do
  putsCheck = `grep puts lib/*`
  if putsCheck.size > 0
   puts "********** WARNING: stray puts left in code"
  end
  puts "generated latest version"
end

task :docs do
  `rm -rf doc`
  `rdoc --line-numbers -U README CHANGELOG LICENSE lib/*.rb`
end