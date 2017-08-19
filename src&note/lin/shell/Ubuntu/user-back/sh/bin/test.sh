test=~/bin/test
if [ -f $test ] ; then
  date
  else touch $test 
fi

test2="~/bin/test"
if [ -f "$test2" ] ; then
echo "$test2 is exists.... " 
 else echo "$test2 is not exists.."
fi
