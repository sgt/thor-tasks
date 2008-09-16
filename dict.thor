class Dict < Thor
  DICT = "/usr/share/dict/words"

  desc 'random', 'Print a random dictionary word'
  method_options :length=>:optional, :maxlength=>:optional, :count=>:optional
  def random
    random_from_file_handle(File.open(DICT))
  end

  desc 'random_ends_with STR', "Print a random dictionary word that ends with specific string"
  method_options :length=>:optional,  :maxlength=>:optional, :count=>:optional
  def random_ends_with(str)
    random_from_file_handle(File.popen("grep #{str}$ #{DICT}"))
  end

  desc 'random_starts_with STR', "Print a random dictionary word that starts with specific string"
  method_options :length=>:optional,  :maxlength=>:optional,:count=>:optional
  def random_starts_with(str)
    random_from_file_handle(File.popen("grep ^#{str} #{DICT}"))
  end

  def random_from_file_handle(dict_f)
    length = options[:length].to_i
    maxlength = options[:maxlength].to_i
    count = options[:count].to_i
    count = 1 if count.nil? || count < 1
    
    length_ok = !length.nil? && length > 0
    maxlength_ok = !maxlength.nil? && maxlength > 0

    lines = dict_f.readlines
    if length_ok || maxlength_ok
      f_lines = if maxlength_ok
        lines.find_all {|x| x.length <= (maxlength + 1)}
      else
        lines.find_all {|x| x.length == (length + 1)}
      end
      count.times { puts f_lines[rand(f_lines.size-1)] }
    else
      count.times { puts lines[rand(dict_f.lineno-1)] }
    end
    dict_f.close()
  end
end
