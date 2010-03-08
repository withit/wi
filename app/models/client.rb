class Client
  def self.all
    Dir.glob("#{Rails.root}/public/content/clients/*.jpg").sort.collect do |path|
      new(File.basename(path))
    end
  end
  
  def initialize filename
    @filename = filename
  end

  def url
  "/content/clients/#{@filename}"
  end
end