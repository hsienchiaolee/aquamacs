require 'find'

# task :default => '~/.emacs.d/init.el'
# task :default => '~/.bashrc'
task :default => 'init.el'
task :default => '.bashrc'

def linkFile(dir, file)
  filepath = dir + file
  unless File.exists?(filepath)
    sh "ln -s #{Dir.pwd}/#{file} '#{filepath}'"
  end
end
  
desc 'Emacs Setup'
task 'emacs' do
  emacsDir = "#{ENV['HOME']}/.emacs.d"
  subDirs = ["settings", "snippets"]
  subDirs.each { |dir|
    path = emacsDir + dir
    unless File.directory?(path)
      File.mkdir_p(path)
    end
  }
  
  files = ["settings", "snippets", "init.el"]
  files.each { |file|
    linkFile(emacsDir, file)
  }
end

desc '.bashrc Setup'
task 'bashrc' do
  linkFile("#{ENV['HOME']}/", ".bashrc")
end
