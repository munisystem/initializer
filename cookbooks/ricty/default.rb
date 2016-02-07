execute 'Move ricty directory' do
  command 'cp -f /usr/local/Cellar/ricty/3.2.4/share/fonts/Ricty*.ttf /Users/muni/Library/Fonts/'
end

execute 'Delete cache' do
  command 'fc-cache -vf'
end
