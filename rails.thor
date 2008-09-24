class Rails < Thor
  desc 'commit_deploy MSG', 'Commit changes, push and deploy'
  def commit_deploy(msg)
    system "git", "add", "."
    system "git", "commit", "-m", msg
    system "git", "push"
    redeploy
  end

  desc 'redeploy', 'deploy and restart'
  def redeploy
    system "cap", "deploy"
    system "cap", "deploy:stop"
    system "cap", "deploy:start"
  end
end
