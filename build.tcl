#!/usr/bin/tclsh

set arch "noarch"
set base "tclsoap-tclsoap"
set fileurl "http://tclsoap.cvs.sourceforge.net/viewvc/tclsoap/tclsoap/?view=tar"

set var [list wget $fileurl -O $base.tar.gz]
exec >@stdout 2>@stderr {*}$var

if {[file exists build]} {
    file delete -force build
}

file mkdir build/BUILD build/RPMS build/SOURCES build/SPECS build/SRPMS
file copy -force $base.tar.gz build/SOURCES

set buildit [list rpmbuild --target $arch --define "_topdir [pwd]/build" -bb tclsoap.spec]
exec >@stdout 2>@stderr {*}$buildit

# Remove our source code
file delete $base.tar.gz

