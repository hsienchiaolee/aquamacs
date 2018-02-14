require 'find'

# task :default => '~/Library/Preferences/Aquamacs Emacs/Preferences.el'
# task :default => '~/Library/Preferences/Aquamacs\ Emacs/customizations.el'
# task :default => '~/.bashrc'
task :default => 'Preferences.el'
task :default => 'customizations.el'
task :default => '.bashrc'

def linkFile(dir, file)
  filepath = dir + file
  unless File.exists?(filepath)
    sh "ln -s #{Dir.pwd}/#{file} '#{filepath}'"
  end
end
  
desc 'Emacs Setup'
task 'emacs' do
  emacsDir = "#{ENV['HOME']}/Library/Preferences/Aquamacs Emacs/"
  
  files = ["Packages/settings", "Preferences.el", "customizations.el"]
  files.each { |file|
    linkFile(emacsDir, file)
  }
end

desc '.bashrc Setup'
task 'bashrc' do
  linkFile("#{ENV['HOME']}/", ".bashrc")
end
