execute 'Download my dotfiles' do
  command 'curl -sL https://raw.githubusercontent.com/munisystem/dotfiles/master/entrypoint | sh'
end

execute 'Set default shell zsh' do
  command 'chsh -s /bin/zsh'
end
