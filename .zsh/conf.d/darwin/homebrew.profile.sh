typeset -xT PKG_CONFIG_PATH pkg_config_path
typeset -gU PKG_CONFIG_PATH pkg_config_path
HOMEBREW_PREFIX=`brew --prefix`
export pkg_config_path=(
    $HOMEBREW_PREFIX/opt/libpq/lib/pkgconfig(N-/)
    $HOMEBREW_PREFIX/opt/mysql-client/lib/pkgconfig(N-/)
    $HOMEBREW_PREFIX/opt/openssl@1.1/lib/pkgconfig(N-/)
    $HOMEBREW_PREFIX/opt/openssl@3/lib/pkgconfig(N-/)
    $HOMEBREW_PREFIX/opt/readline/lib/pkgconfig(N-/)
    $pkg_config_path
)

typeset -gU LDFLAGS CPPFLAGS
ldflag_paths=(
    $HOMEBREW_PREFIX/opt/libpq/lib(N-/)
    $HOMEBREW_PREFIX/opt/mysql-client/lib(N-/)
    $HOMEBREW_PREFIX/opt/openssl@1.1/lib(N-/)
    $HOMEBREW_PREFIX/opt/openssl@3/lib(N-/)
    $HOMEBREW_PREFIX/opt/readline/lib(N-/)
)
cppflag_paths=(
    $HOMEBREW_PREFIX/opt/libpq/include(N-/)
    $HOMEBREW_PREFIX/opt/mysql-client/include(N-/)
    $HOMEBREW_PREFIX/opt/openssl@1.1/include(N-/)
    $HOMEBREW_PREFIX/opt/openssl@3/include(N-/)
    $HOMEBREW_PREFIX/opt/readline/include(N-/)
)

export LDFLAGS="${ldflag_paths[@]/#/-L} ${LDFLAGS}"
export CPPFLAGS="${cppflag_paths[@]/#/-I} ${CPPFLAGS}"

unset ldflag_paths
unset cppflag_paths
unset HOMEBREW_PREFIX
