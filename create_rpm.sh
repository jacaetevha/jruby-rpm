#!/bin/bash

srcdir=`rpm --eval '%{_sourcedir}'`
rpmdir=$(dirname $srcdir)/RPMS
file=$srcdir/jruby-bin-1.6.7.2.tar.gz
url='http://jruby.org.s3.amazonaws.com/downloads/1.6.7.2/jruby-bin-1.6.7.2.tar.gz'

[[ ! -f $file ]] && wget $url --directory-prefix=$srcdir

cp jgem  jirb  jrake  jrdoc  jri  jruby  jrubyc $srcdir

# build rpm
rpmbuild -bb jruby.spec

echo "Done. Now check the appropriate sub-directory of $rpmdir for the RPM"
