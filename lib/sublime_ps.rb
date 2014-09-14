require 'thor'

module SublimePS
  module FilesManipulation
    autoload :SublimePSPreferences, 'sublime_ps/files_manipulation/sublime_ps_preferences'
    autoload :SublimePreferences, 'sublime_ps/files_manipulation/sublime_preferences'
    autoload :Preset, 'sublime_ps/files_manipulation/preset'
  end

  class CommandLineInterface < Thor

    desc 'apply_preset <present name>',
         'Add settings of PRESET_NAME on sublime preferences file'
    long_desc <<-LONGDESC
      Use this command to apply the preferences of '~/.sublime_ps/[PRESET_NAME].json'
      on your SublimeText preferences file.
      If sublime_ps don't found the SublimeText preferences, you can chenge the file
      path on '~/.sublime_ps/sublime_ps.yml'.
    LONGDESC
    options :aliases => ['ap', 'a']
    def apply_preset(preset_name)
      preset_content      = FilesManipulation::Preset.file_content(preset_name)
      sublime_preferences = FilesManipulation::SublimePreferences.new
      preferences_content = sublime_preferences.file_content
      preferences_content.merge!(preset_content)
      sublime_preferences.set_content(preferences_content)
      puts "Preferences changed to preset '#{preset_name}' \e[32m[OK]\e[0m"
    end
  end
end
