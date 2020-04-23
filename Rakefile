require 'find'

# task :default => '~/Library/Preferences/Aquamacs Emacs/Preferences.el'
# task :default => '~/.bashrc'
task :default => 'Preferences.el'
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
  subDirs = ["Packages/settings", "Packages/snippets"]
  subDirs.each { |dir|
    path = emacsDir + dir
    unless File.directory?(path)
      File.mkdir_p(path)
    end
  }
  
  files = ["Packages/settings", "Packages/snippets", "Preferences.el"]
  files.each { |file|
    linkFile(emacsDir, file)
  }
end

desc '.bashrc Setup'
task 'bashrc' do
  linkFile("#{ENV['HOME']}/", ".bashrc")
end
