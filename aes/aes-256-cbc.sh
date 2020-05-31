#!/bin/bash

password_str="This is password"
echo -n "$password_str"| ../../openssl aes-256-cbc -in my_file.txt -out my_enc.txt -pass stdin
echo -n "$password_str"| ../../openssl aes-256-cbc -d -in my_enc.txt -out my_dec.txt -pass stdin
