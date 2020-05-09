num=0
pre=""
serie=0
while read line; do  
	newline=`echo $line | tr -cd "[:print:]"`
	newline=`echo $newline | tr -s "[:punct:]" "_"`
	newline=`echo $newline | tr -s "[:blank:]" "-"`
        if [[ $line == *"."* ]]; then
  	  dot="\\."
	  num=`echo $line | grep -bo $dot | sed 's/:.*$//'`
	  pre=${line:0:num}
	  touch "${newline}.md" 
	  serie=1
	else
	  touch "${pre}_${serie}_${newline}.md"; 
	  let "serie++"
  	fi
done < TOC.txt
