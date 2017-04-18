%{!?directory:%define directory /usr}

%define buildroot %{_tmppath}/%{name}

Name:          tclsoap
Summary:       Binding for Tcl clients to RPC and web services
Version:       1.6.8.1
Release:       1
License:       MIT
Group:         Development/Libraries/Tcl
Source:        tclsoap-tclsoap.tar.gz
URL:           http://tclsoap.cvs.sourceforge.net
BuildArch:     noarch
BuildRequires: autoconf
BuildRequires: tcl
Requires:      tcl >= 8.4
Requires:      tdom
BuildRoot:     %{buildroot}

%description
TclSOAP provides method binding for Tcl clients to remote procedures and
web services implemented using either SOAP, XML-RPC or JSON-RPC.

%prep
%setup -q -n %{name}

%build
chmod 755 ./configure
./configure \
	--prefix=%{directory} \
	--exec-prefix=%{directory} \
	--libdir=%{directory}/%{_data}
make 

%install
make DESTDIR=%{buildroot} pkglibdir=%{_datadir}/tcl/%{name}%{version} install

%clean
rm -rf %buildroot

%files
%defattr(-,root,root)
%{_datadir}/tcl

