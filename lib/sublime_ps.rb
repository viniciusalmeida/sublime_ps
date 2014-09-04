require 'thor'

module SublimePS
  module FilesManipulation
    autoload :SublimePSPreferences, 'sublime_ps/files_manipulation/sublime_ps_preferences'
    autoload :SublimePreferences, 'sublime_ps/files_manipulation/sublime_preferences'
    autoload :Preset, 'sublime_ps/files_manipulation/preset'
  end

  class CommandLineInterface < Thor
    desc 'set_preset PRESET_NAME',
         'Add settings of PRESET_NAME on sublime preferences file'
    def set_preset(preset_name)
      sublime_preferences = FilesManipulation::SublimePreferences.new
      preferences_content = sublime_preferences.file_content
      preset_content      = FilesManipulation::Preset.file_content(preset_name)
      preferences_content.merge!(preset_content) if preset_content
      sublime_preferences.set_content(preferences_content, preset_name)
    end
  end
end
