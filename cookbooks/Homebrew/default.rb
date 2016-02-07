execute 'Install Homebrew' do
  command <<-EOL
     ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
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

execute 'Install brewdler' do
  command 'brew tap Homebrew/brewdler'
end

execute 'Download my Brewfile' do
  command 'curl -sL https://raw.githubusercontent.com/munisystem/Brewfile/master/install.sh | sh'
  not_if 'test -e /Users/muni/Brewfile'
end

execute 'Execute brew brewdler' do
  command 'brew brewdler'
  cwd '/Users/muni/Brewfile'
end
