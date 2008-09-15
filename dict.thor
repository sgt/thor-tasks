class Dict < Thor
  DICT = "/usr/share/dict/words"
  
  desc 'random', 'Print a random dictionary word'
  method_options :length=>:optional
  def random
    random_from_file_handle(File.open(DICT))
  end
    
  desc 'random_ends_with STR', "Print a random dictionary word that ends with specific string"
  method_options :length=>:optional
  def random_ends_with(str)
    random_from_file_handle(File.popen("grep #{str}$ #{DICT}"))
  end
  
  def random_from_file_handle(dict_f)
    length = options[:length].to_i
    if !length || length == 0
      puts dict_f.readlines[rand(dict_f.lineno)].strip
    else
      lines = dict_f.readlines.map {|x| x.strip}.find_all {|x| x.length <= length}
      puts lines[rand(lines.size)]
    end
    dict_f.close()
  end
end
