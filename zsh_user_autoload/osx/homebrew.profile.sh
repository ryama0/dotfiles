typeset -xT PKG_CONFIG_PATH pkg_config_path
typeset -gU PKG_CONFIG_PATH pkg_config_path
export pkg_config_path=(
    /usr/local/opt/libpq/lib/pkgconfig(N-/)
    /usr/local/opt/mysql-client/lib/pkgconfig(N-/)
    /usr/local/opt/openssl@1.1/lib/pkgconfig(N-/)
    $pkg_config_path
)

typeset -gU LDFLAGS CPPFLAGS
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
export LDFLAGS="${ldflag_paths[@]/#/-L} ${LDFLAGS}"
export CPPFLAGS="${cppflag_paths[@]/#/-L} ${CPPFLAGS}"

unset ldflag_paths
unset cppflag_paths