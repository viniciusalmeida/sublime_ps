require 'json'

module SublimePS::FilesManipulation
  class Preset
    @@path_dir = "#{File.expand_path('~')}/.sublime_ps"

    def initialize(preset_name)
      @preset_name = preset_name
    end

    def file_content
      if File.exists?(preset_path(@preset_name))
        JSON.parse(File.open(preset_path(@preset_name)).read)
      else
        puts "Preset '#{@preset_name}' not find on #{@@path_dir} dir \e[31m[FAIL]\e[0m"
        nil
      end
    end

    private

      def preset_path(preset_name)
        "#{@@path_dir}/#{preset_name}.json"
      end
  end
end
