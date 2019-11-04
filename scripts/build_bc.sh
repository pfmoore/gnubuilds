#!/bin/sh

cd $BUILD
wget https://ftp.gnu.org/gnu/bc/bc-${BC_VER}.tar.gz
tar xf bc-${BC_VER}.tar.gz
cd bc-${BC_VER}

# Hack. This needs to be built as part of make, using a program comiled
# in the make process. But of course, we've configured make to build
# Windows executables, which won't run on Fedora.
# This libmath.h was built by hand, by running a Fedora build and copying
# the file from there.
cat >bc/libmath.h <<EOF
{"@iK20:s2:p@r",
"@iF1,5.6,7,8,9,10,11,12,13,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C1,0:",
"s14:pl7:s0:pl14:RN1:l5:0<Z2:1s12:pl5:ns5:pN2:l2:s15:pK6:l15:+",
"K.44:l5:*+s13:pl5:cS1+s2:pN3:l5:1>Z4:l10:1+s10:pl5:K2:/s5:pl2:",
"1+s2:pJ3:N4:l13:s2:p1l5:+s14:pl5:s6:p1s8:pK2:s11:pN6:1B7:J5:N8:",
"l11:i11:pJ6:N7:l6:l5:*s6:l8:l11:*s8:/s9:pl9:0=Z9:l10:0>Z10:N11:",
"l10:d10:Z12:l14:l14:*s14:pJ11:N12:N10:l15:s2:pl12:Z13:1l14:/R",
"N13:l14:1/RN9:l14:l9:+s14:pJ8:N5:0R]@r",
"@iF2,5.7,9,10,11,12,13,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C2,0:",
"s14:pl7:s0:pl14:RN1:l5:0{Z2:1K10:l2:^-1/RN2:l2:s15:pK6:l2:+s2:",
"pK2:s10:p0s11:pN3:l5:K2:}Z4:l10:K2:*s10:pl5:cRs5:pJ3:N4:N5:l5:",
"K.5:{Z6:l10:K2:*s10:pl5:cRs5:pJ5:N6:l5:1-l5:1+/s13:s14:pl13:l13:",
"*s12:pK3:s11:pN8:1B9:J7:N10:l11:K2:+s11:pJ8:N9:l13:l12:*s13:l11:",
"/s9:pl9:0=Z11:l10:l14:*s14:pl15:s2:pl14:1/RN11:l14:l9:+s14:pJ10:N7:",
"0R]@r",
"@iF3,5.7,9,11,12,13,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C3,0:",
"s14:pl7:s0:pl14:RN1:l2:s15:pK1.1:l15:*K2:+s2:p1C4,0:s14:pl5:0",
"<Z2:1s12:pl5:ns5:pN2:0s2:pl5:l14:/K2:+K4:/s13:pl5:K4:l13:*l14:",
"*-s5:pl13:K2:%Z3:l5:ns5:pN3:l15:K2:+s2:pl5:s9:s14:pl5:nl5:*s16:",
"pK3:s11:pN5:1B6:J4:N7:l11:K2:+s11:pJ5:N6:l9:l16:l11:l11:1-*/*",
"s9:pl9:0=Z8:l15:s2:pl12:Z9:l14:n1/RN9:l14:1/RN8:l14:l9:+s14:p",
"J7:N4:0R]@r",
"@iF5,5.7,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C5,0:s14:pl7:s0:pl14:",
"RN1:l2:s15:pl2:K1.2:*s2:pl5:1C4,0:K2:*+C3,0:s14:pl15:s2:pl14:",
"1/R0R]@r",
"@iF4,5.6,7,9,10,11,12,13,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:",
"C4,0:s14:pl7:s0:pl14:RN1:1s12:pl5:0<Z2:1ns12:pl5:ns5:pN2:l5:1",
"=Z3:l2:K25:{Z4:K.7853981633974483096156608:l12:/RN4:l2:K40:{Z5:",
"K.7853981633974483096156608458198757210492:l12:/RN5:l2:K60:{Z6:",
"K.785398163397448309615660845819875721049292349843776455243736",
":l12:/RN6:N3:l5:K.2:=Z7:l2:K25:{Z8:K.1973955598498807583700497",
":l12:/RN8:l2:K40:{Z9:K.1973955598498807583700497651947902934475",
":l12:/RN9:l2:K60:{Z10:K.197395559849880758370049765194790293447585103787852101517688",
":l12:/RN10:N7:l2:s15:pl5:K.2:>Z11:l15:K5:+s2:pK.2:C4,0:s6:pN11:",
"l15:K3:+s2:pN12:l5:K.2:>Z13:l10:1+s10:pl5:K.2:-1l5:K.2:*+/s5:",
"pJ12:N13:l5:s13:s14:pl5:nl5:*s16:pK3:s11:pN15:1B16:J14:N17:l11:",
"K2:+s11:pJ15:N16:l13:l16:*s13:l11:/s9:pl9:0=Z18:l15:s2:pl10:l6:",
"*l14:+l12:/RN18:l14:l9:+s14:pJ17:N14:0R]@r",
"@iF6,13,5.6,7,8,9,10,11,12,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl13:",
"l5:C6,00:s14:pl7:s0:pl14:RN1:l2:s15:p0s2:pl13:1/s13:pl13:0<Z2:",
"l13:ns13:pl13:K2:%1=Z3:1s12:pN3:N2:1s10:pK2:s11:pN5:l11:l13:{",
"B6:J4:N7:l11:i11:pJ5:N6:l10:l11:*s10:pJ7:N4:K1.5:l15:*s2:pl5:",
"l13:^K2:l13:^/l10:/s10:p1s9:s14:pl5:nl5:*K4:/s16:pK1.5:l15:*l10:",
"cL+l10:cS-s2:p1s11:pN9:1B10:J8:N11:l11:i11:pJ9:N10:l9:l16:*l11:",
"/l13:l11:+/s9:pl9:0=Z12:l15:s2:pl12:Z13:l10:nl14:*1/RN13:l10:",
"l14:*1/RN12:l14:l9:+s14:pJ11:N8:0R]@r",0}
EOF

mingw64-configure CFLAGS="-Drandom=rand"
make
zip -j9 ${TARGET}/bc-${BC_VER}.zip */*.exe
