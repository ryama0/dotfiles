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

