#!/bin/csh

echo '< ---- START ---- >'

pkg_version -l "<"

echo '< ---- ---- ---- >'

portupgrade -a

echo '< ---- END ---- >'

# EOF
