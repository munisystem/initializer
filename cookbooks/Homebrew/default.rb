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

template '/Users/muni/Brewfile' do
  source './templates/Brewfile'
  mode '0755'
end

execute 'Execute brew brewdler' do
  command 'brew brewdler'
  cwd '/Users/muni'
end
