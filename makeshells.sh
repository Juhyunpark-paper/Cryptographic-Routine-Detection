#!/bin/bash

comp=""
bool=""

readarray -t myarray < enc.txt
for entry in "${myarray[@]}"
do
    read -r -a arr <<< "$entry"
    for ent in "${arr[@]}"
    do
	IFS='-'
	read -ra name <<< "$ent"

	if [ "$comp" != "$name" ]; then
	   if [ "$bool" ]; then
	       cd ..
	   fi
	    
	   mkdir "$name"
	   cd "$name"
	   comp=$name
	   bool="true"
	fi
	IFS=' '
	cat > "$ent".sh <<EOF
#!/bin/bash

EOF
	chmod 755 "$ent".sh

	echo "password_str=\"This is password\"" >> "$ent".sh
	echo "echo -n \"\$password_str\"| ../../openssl $ent -in my_file.txt -out my_enc.txt -pass stdin" >> "$ent".sh
	echo "echo -n \"\$password_str\"| ../../openssl $ent -d -in my_enc.txt -out my_dec.txt -pass stdin" >> "$ent".sh
    done
done
