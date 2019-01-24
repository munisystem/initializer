execute 'Install Homebrew' do
  command <<-EOL
     ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  EOL
  notifies :run, 'execute[Update Homebrew]', :immediately
  notifies :run, 'execute[Check Homebrew]', :immediately
end

execute 'Check Homebrew' do
  command 'brew doctor'
  action :nothing
end

execute 'Update Homebrew' do
  command 'brew update'
  action :nothing
end

execute 'Install cask' do
  command 'brew install caskroom/cask/brew-cask'
end

execute 'Install brew bundle' do
  command 'brew tap Homebrew/bundle'
end

execute 'Download my Brewfile' do
  command 'curl -sL https://raw.githubusercontent.com/munisystem/Brewfile/master/entrypoint | sh'
  not_if 'test -e /Users/muni/Brewfile'
end

execute 'Execute brew bundle' do
  command 'brew bundle'
  cwd '/Users/muni/Brewfile'
end
