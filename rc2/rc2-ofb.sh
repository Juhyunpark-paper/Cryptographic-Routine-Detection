#!/bin/bash

password_str="This is password"
echo -n "$password_str"| ../../openssl rc2-ofb -in my_file.txt -out my_enc.txt -pass stdin
echo -n "$password_str"| ../../openssl rc2-ofb -d -in my_enc.txt -out my_dec.txt -pass stdin
