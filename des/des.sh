#!/bin/bash

password_str="This is password"
echo -n "$password_str"| ../../openssl des -in my_file.txt -out my_enc.txt -pass stdin
echo -n "$password_str"| ../../openssl des -d -in my_enc.txt -out my_dec.txt -pass stdin
