require 'yaml'
require 'fileutils'

module SublimePS::FilesManipulation
  class SublimePSPreferences
    @@home_path = File.expand_path('~')
    @@path      = "#{@@home_path}/.sublime_ps/sublime_ps.yml"

    def initialize
      create_conf_file if conf_file_exist? == false
      @conf_file = load_conf_file
    end

    def sublime_preferences_file_path
      @conf_file[:sublime_preferences_path]
    end

    private

      def conf_file_exist?
        File.exists?(@@path)
      end

      def create_conf_file
        FileUtils::mkdir_p("#{@@home_path}/.sublime_ps")
        output = File.new(@@path, 'w')
        output.puts(YAML.dump({ sublime_preferences_path: initial_sublime_preferences_path }))
        output.close
        puts "Create configuration file to sublime_ps (#{@@path}) \e[32m[OK]\e[0m"
      end

      def load_conf_file
        YAML::load_file(@@path)
      end

      def initial_sublime_preferences_path
        "#{@@home_path}/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings"
      end
  end
end
