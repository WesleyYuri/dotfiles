reload ()
{
  source $HOME/.zshrc
}

project ()
{
  project=$(fd --type d --max-depth 1 . $dev_dir | fzf)
  cd "$project"
}

docker_create_mariabd ()
{
  docker run -d --name mariadb -e MYSQL_ROOT_PASSWORD=secret -p 3306:3306 -v $HOME/Development/masterix/bkp/:/bkp --restart unless-stopped mariadb
}
