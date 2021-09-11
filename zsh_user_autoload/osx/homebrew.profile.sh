typeset -xT PKG_CONFIG_PATH pkg_config_path
typeset -U PKG_CONFIG_PATH pkg_config_path
pkg_config_path=(
    /usr/local/opt/libpq/lib/pkgconfig(N-/)
    /usr/local/opt/mysql-client/lib/pkgconfig(N-/)
    /usr/local/opt/openssl@1.1/lib/pkgconfig(N-/)
    $pkg_config_path
)

typeset -xT LDFLAGS ldflags
typeset -xT CPPFLAGS cppflags
typeset -U LDFLAGS CPPFLAGS
ldflag_paths=(
    /usr/local/opt/libpq/lib(N-/)
    /usr/local/opt/mysql-client/lib(N-/)
    /usr/local/opt/openssl@1.1/lib(N-/)
)
cppflag_paths=(
    /usr/local/opt/libpq/include(N-/)
    /usr/local/opt/mysql-client/include(N-/)
    /usr/local/opt/openssl@1.1/include(N-/)
)

export ldflags=(
    ${ldflag_paths[@]/#/-L}
    $ldflags
)
export cppflags=(
    ${cppflag_paths[@]/#/-I}
    $cppflags
)

unset ldflag_paths
unset cppflag_paths