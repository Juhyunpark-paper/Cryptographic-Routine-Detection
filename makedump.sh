#!/bin/bash

#if [ -z "$*" ]
#then
    #echo "need 1 argument!!"
    #exit 0

if [ "$EUID" -ne 0 ]
then
    echo "Need root privilege!!"
    exit 0
#else
    #echo "Current directory: ${PWD##*/}"
fi

for d in */
do
    cd $d
    cat > my_file.txt <<EOF
DgKBo4t]@#)*yj40CW189_l"gnp2RR5dZ^$]RsLC$-GJWE>;5\n+\]~jD!bZ6,hCQ.YW.&KvRSIttCP3SIFHvde54n`C+Z>-Wl*9C`Yy^UsWL{}nR$@"t>a$U$x9i&@VG:y<kx{6JS&gh:M*CY[J9ZvMs>uuk(QN#_cLe34qT}@$%D1G0Kg@Um#xKd6mz,z~O|:d+ogl.NF0AnOy+4M\HT{sc"8P~#t=sFMkKDc`jP\l\>iGK='0^EYumiVefk~[i}yQL{8kGV!FAF7=#Kg`9xrEZ}:^Y_j#Lnu&BTotw5N%C,g^S1$0>s}"U:Tnh{|-4Z]0|.qf$['|Jp9[e(,^~oadt.vgN:tZHi*%OZ>rjW$,BIVFhrpp-tuQY$U,F6/]Xz\x-]CRU}e&U:M3yNh1=e<Yd|TK3_wO1UH~0o*DsBckJz4eQ}n]kVg:mm4UET)dt{g5KNDy.-7Ui43<F{A&*Sh4u~}irZ~i(9UT9Yhkwo@8G~h@])YbUyYch=LZAk'.a[vsvCktM~)zShOCR;/dGmA?`7*Y`E}M9]C2J'=7kK6d&>}v^]uC|5:#V@+'yVWl7P{<?fc<=9J[L6$Gf@/\,OtaTm`w0k,XA|}Zt[)e5[WONvGWF#Bj4l`\a1O8&*@;JY:$=FkrreU];\YxCv~<f'O2y/Dg$Cs{&24|IuU(g8d8T[]f@k|c.cOc3Kj?d$-P;]:D?wi,BUH%#|oJi-9,xp:U'k&H9vU7VRl[4h\_I*DO7XSSUmA1~Da}RYO=KuS.X?iJO&wgDqb[.=oRd#-)gJadRG}`{8+w+;d3BanA&j@|mhnW:mq'XoixIh^v]yn]\Ia5,G;?KeY72/)X{*&IkNt@CF|OwHO\Ll,@|vn?*YI+!<B&;w0tc-Lh4T@BmIr@@tOz(l29%EZgFGgq<$ME#Gj<Mo7-qE$$n&!oAg#4>,KF)`e"Mc%[S|ID\uIc^k^.i]#7cdqAL??ry]Sadc/!z}{]Hk4o@+`ZVD<urlie
EOF
    for entry in "$search_dir"./*.sh
    do
	echo ${entry:2}
	perf record -e intel_pt/ptw/u $entry
	perf script -D > ${entry:2:-3}.dump
	python ../PtwriteTNT.py -i ${entry:2:-3}.dump -o ${entry:2:-3}.txt
    done
    cd ..
done



#for entry in "$search_dir"./"${PWD##*/}"*.sh
#do
    #perf record -e intel_pt/ptw/u $entry
    #perf script -D > ${entry:2:-3}.dump
    #echo ${entry:2:-3}
#done
