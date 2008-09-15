 class Default < Thor
  
  THOR_TASKS = %w(dict)
  
  desc "install", "Installs the thor-git tasks"
  def install
    THOR_TASKS.each do |tt|
      url = "http://github.com/sgt/thor-tasks/tree/master/#{tt}.thor?raw=true"
      thor("install", url, "--as=#{taskname(tt)}")
    end
  end
  
  desc "update", "Update all tasks"
  def update
    THOR_TASKS.each do |tt|
      thor("update", taskname(tt))
    end
  end
  
  def thor(cmd, *options)
    system("thor", cmd, *options)
  end
  
  def taskname(name)
    "sgt-#{name}"
  end
end
