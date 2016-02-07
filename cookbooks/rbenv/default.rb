execute 'Install ruby' do
  command <<-EOL
    brew link readline --force
    MAKE_OPTS="-j 4" RUBY_CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline)" rbenv install 2.3.0
  EOL
  not_if 'rbenv versions | grep 2.3.0'
  notifies :run, 'execute[Set global ruby]', :immediately
end

execute 'Set global ruby' do
  command 'rbenv global 2.3.0'
  action :nothing
end
