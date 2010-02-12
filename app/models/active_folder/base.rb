require 'RedCloth'

module ActiveFolder
  class Base
    extend ActiveModel::Naming
    
    def to_model
      self
    end
    
    def to_param
       File.basename(Dir.glob(File.join(@path,"*.yml")).first, '.yml')
    end
    
    def update_attributes attributes
      @content.merge! attributes      
      dump
      true
    end
    
    def self.directory
      File.join(Rails.root, 'public','content', folder_name)
    end

    def self.folder_name
      self.to_s.pluralize.underscore
    end

    def self.all
      Dir.glob(File.join(directory, '*')).sort.collect{|p| new(p)}
    end

    def self.find name
      d = File.dirname(Dir.glob(File.join(directory, '*',"#{name}.yml")).first)
      new(d)
    end

    def initialize path
      @path = path
      load
    end

    def load
      yml_file_path = Dir.glob(File.join(@path, '*.yml')).first
      @content = File.open(yml_file_path){|yf| YAML::load(yf)}
    end
    
    def dump
      yml_file_path = Dir.glob(File.join(@path, '*.yml')).first
      File.open(yml_file_path,'w'){|yf| yf.write @content.to_yaml}
    end

    def image
      i = Image.new
      url = Dir.glob(File.join(@path, '*.jpg')).first
      url = url.split('public').last
      i.url = url
      i
    end

    class Image
      attr_accessor :url
    end
    
    class PngContent
      def initialize path
        @path = path
        @url = path.split('public').last
      end
      
      attr_reader :url
    end
    
    class JpgContent
      def initialize path
        @path = path
        @url = path.split('public').last
      end
      
      attr_reader :url
    end
    
    class TextileContent
      def initialize path
        @path = path
      end
      
      def to_s
        RedCloth.new(File.read(@path)).to_html
      end
    end

    def method_missing method, *args, &block
      return @content[method.to_s] if @content[method.to_s]
      if content_path = Dir.glob(File.join(@path,"#{method}.*")).first
        content_extention = File.extname(content_path)[1..-1]
        content_class = "active_folder/base/#{content_extention}_content".classify.constantize
        return content_class.new(content_path)
      end
    end
  end
end
  