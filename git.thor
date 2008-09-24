class Git < Thor
  desc 'push_changes MSG', 'add, commit with MSG and push'
  def push_changes(msg)
    system "git", "add", "."
    system "git", "commit", "-m", msg
    system "git", "push"
  end
end
