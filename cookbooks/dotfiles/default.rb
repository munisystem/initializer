execute 'Download my dotfiles' do
  command 'curl -sL https://raw.githubusercontent.com/munisystem/dotfiles/master/install.sh | sh'
end

execute 'Set default shell zsh' do
  command 'chsh -s /bin/zsh'
end
