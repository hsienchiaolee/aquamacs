require 'find'

# task :default => '~/Library/Preferences/Aquamacs Emacs/Preferences.el'
# task :default => '~/Library/Preferences/Aquamacs\ Emacs/customizations.el'
# task :default => '~/.bashrc'
task :default => 'Preferences.el'
task :default => 'customizations.el'
task :default => '.bashrc'

desc '~/Library/Preferences/Aquamacs Emacs/Preferences.el'
task 'Preferences.el' do
  sh "cp Preferences.el '#{ENV['HOME']}/Library/Preferences/Aquamacs Emacs/Preferences.el'"
end

desc '~/Library/Preferences/Aquamacs\ Emacs/customizations.el'
task 'customizations.el' do
  sh "cp customizations.el '#{ENV['HOME']}/Library/Preferences/Aquamacs Emacs/customizations.el'"
end

desc '~/.bashrc'
task '~/.bashrc' do
  sh "cp .bashrc #{ENV['HOME']}/.bashrc"
end
