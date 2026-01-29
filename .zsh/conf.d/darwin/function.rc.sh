# クリップボード操作
function clipctl() {
  if [ $# -ne 1 ]; then
    cat <<_EOH_
Usage: clipctl [paste|copy]
_EOH_
  fi
  case $1 in
    paste) pbpaste ;;
    copy) pbcopy ;;
    *) return 1 ;;
  esac
  return 0
}

# OSパッケージ管理
function pkgctl() {
  if [ $# -ne 1 ]; then
    cat <<_EOH_
Usage: pkgctl [update|upgrade|cleanup|full-upgrade]
_EOH_
  fi
  arg=$1
  case $1 in
    update) brew update ;;
    upgrade) brew upgrade && brew upgrade --cask && mise upgrade ;;
    cleanup) brew cleanup && brew doctor ;;
    full-upgrade) pkgctl update && pkgctl upgrade && pkgctl cleanup ;;
    *) return 1 ;;
  esac
  return 0
}