class Dict < Thor
  DICT = "/usr/share/dict/words"
  
  desc 'random', 'Print a random dictionary word'
  def random
    dict_f = File.open(DICT)
    puts dict_f.readlines[rand(dict_f.lineno)]
  end
end
