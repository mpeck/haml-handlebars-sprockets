require "haml-handlebars-sprockets/version"
require "haml"
require "sprockets"

module Sprockets
  class HbtProcessor < Tilt::Template
    def self.default_mime_type
      'application/javascript'
    end

    def self.default_namespace
      'this.HBT'
    end

    def prepare
      @namespace = self.class.default_namespace
    end

    attr_reader :namespace

    def evaluate(scope, locals, &block)
      <<-HBT
(function() {
  #{namespace} || (#{namespace} = {});
  #{namespace}[#{scope.logical_path.inspect}] = Handlebars.compile("#{compressanddecode(data)}");
}).call(this);
      HBT
    end

    private
      def compressanddecode(string)
        ::Haml::Engine.new(string, {}).render.gsub(/\n/m, "").strip
      end
  end

  class HbpProcessor < Tilt::Template
    def self.default_mime_type
      'application/javascript'
    end

    def self.default_namespace
      'this.HBP'
    end

    def prepare
      @namespace = self.class.default_namespace
    end

    attr_reader :namespace

    def evaluate(scope, locals, &block)
      <<-HBP
(function() {
  Handlebars.registerPartial('#{scope.logical_path.split("/").last}', "#{compressanddecode(data)}")
}).call(this);
      HBP
    end

    private
      def compressanddecode(string)
        ::Haml::Engine.new(string, {}).render.gsub(/\n/m, "").strip
      end
  end
end


::Sprockets.register_engine '.hbt',    ::Sprockets::HbtProcessor
::Sprockets.register_engine '.hbp',    ::Sprockets::HbpProcessor
