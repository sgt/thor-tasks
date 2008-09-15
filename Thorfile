require 'thor'
 
class Default < Thor
  
  THOR_TASKS = %w(dict)
  
  desc "install", "Installs the thor-git tasks"
  def install
    THOR_TASKS.each do |tt|
      Thor::Runner.new.install("http://github.com/sgt/thor-tasks/tree/master/#{tt}.thor?raw=true")
    end
  end
end
