class Mkv < Thor
  # capture the workflow here now, fine-tune later
  def workflow(in_filename, out_filename)
    system "mkvextract", "tracks", in_filename, "2:audio.dts"
    system "ffmpeg", "-i", "audio.dts", "-acodec", "ac3", "-ac", "6", "-ab", "640k", "audio.ac3"
    system "mkvmerge", "-o", out_filename, "-A", "-S", "--default-language", "eng", in_filename, "audio.ac3"
  end
end
