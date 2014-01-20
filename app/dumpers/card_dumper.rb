class CardDumper
  include Singleton

  def dump
    FileUtils.remove_dir "#{dir_path}", true
    FileUtils.mkdir_p "#{dir_path}"
    Card.all.each_with_index do |c, i| 
      File.open("#{dir_path}/taboo#{i+1}.txt", 'w') do |file| 
        file.write("#{c.word};#{c.taboo1};#{c.taboo2};#{c.taboo3};#{c.taboo4};#{c.taboo5}")
      end
    end
  end

  def dir_path
    "tmp/cards"
  end

end