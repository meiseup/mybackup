function cd()
{
  if [ -d "$1" ];then
    cd "$1"
  else echo "$1" is not directory!
  fi
}
