require 'find'

task :default => '~/Library/Preferences/Aquamacs Emacs/Preferences.el'
task :default => '~/Library/Preferences/Aquamacs\ Emacs/customizations.el'
task :default => '~/.bashrc'

desc '~/Library/Preferences/Aquamacs Emacs/Preferences.el'
task 'Preferences.el' do
  sh "cp -r ./emacs.d/* #{ENV['HOME']}/Library/Preferences/Aquamacs\ Emacs/Preferences.el"
end

desc '~/Library/Preferences/Aquamacs\ Emacs/customizations.el'
task 'customizations.el' do
  sh "cp ./zsh/* #{ENV['HOME']}/Library/Preferences/Aquamacs\ Emacs/customizations.el"
end

desc '~/.bashrc'
task '~/.bashrc' do
  sh "cp .bashrc #{ENV['HOME']}/.bashrc"
end
