require 'json'

module SublimePS::FilesManipulation
  class SublimePreferences
    def initialize
      @sublime_ps_preferences = SublimePSPreferences.new
    end

    def file_content
      JSON.parse(File.open(@sublime_ps_preferences.sublime_preferences_file_path).read)
    end

    def set_content(content, preset_name)
      remove_preference_file_content
      add_set_preference_file_content(content)
      puts "Preferences changed to preset '#{preset_name}' \e[32m[OK]\e[0m"
    end

    private

      def remove_preference_file_content
        File.open(@sublime_ps_preferences.sublime_preferences_file_path, 'w') do |file|
          file.truncate(0)
        end
      end

      def add_set_preference_file_content(content_to_file)
        output_file = File.open(@sublime_ps_preferences.sublime_preferences_file_path, 'w')
        output_file.puts(JSON.pretty_generate(content_to_file))
        output_file.close
      end
  end
end
