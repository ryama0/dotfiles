function clipctl() {
  if [ $# -ne 1 ]; then
    cat <<_EOH_
Usage: clipctl [paste|copy]
_EOH_
  fi
  case $1 in
    paste) xsel -o --clipboard ;;
    copy) xsel -i --clipboard ;;
    *) return 1 ;;
  esac
  return 0
}

