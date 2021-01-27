function pkgctl() {
  if [ $# -ne 1 ]; then
    cat <<_EOH_
Usage: pkgctl [update|upgrade|cleanup|full-upgrade]
_EOH_
  fi
  local distri_name=`get_linux_distribution`
  case ${distri_name} in
      Ubuntu)
          case $1 in
            update) sudo apt update ;;
            upgrade) sudo apt upgrade -y && sudo apt dist-upgrade -y ;;
            cleanup) sudo apt autoremove -y ;;
            full-upgrade) pkgctl update && pkgctl upgrade && pkgctl cleanup ;;
            *) return 1 ;;
          esac
          ;;
  esac

  return 0
}
