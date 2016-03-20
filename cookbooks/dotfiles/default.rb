execute 'Download my dotfiles' do
  command 'curl -sL dots.munisystem.net | sh'
end

template '/etc/shells' do
  source './templates/shells'
  owner 'root'
  group 'wheel'
  mode '0644'
end

execute 'Set default shell zsh' do
  command 'chsh -s /usr/local/bin/fish'
end
