execute 'Install ruby' do
  command <<-EOL
    brew link readline --force
    MAKE_OPTS="-j 4" RUBY_CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline)" rbenv install 2.3.0
  EOL
end
