#!/usr/bin/tclsh

set arch "noarch"
set base "tclsoap-tclsoap"

if {[file exists build]} {
    file delete -force build
}

file mkdir build/BUILD build/RPMS build/SOURCES build/SPECS build/SRPMS
file copy -force $base.tar.gz build/SOURCES

set buildit [list rpmbuild --target $arch --define "_topdir [pwd]/build" -bb tclsoap.spec]
exec >@stdout 2>@stderr {*}$buildit
