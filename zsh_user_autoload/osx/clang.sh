# for OSX
NATIVE_CLANG=/usr/bin/clang

function get_c_include_path() {
  local lines=
  ${NATIVE_CLANG} -x c -v -E /dev/null |& grep Xcode.app | grep -v ignoring | grep -v clang | grep -v /dev/null | gawk '{print $1}' | while read line; do lines=${lines}:$line; done
  echo $lines | gawk '{print gensub(/:(.+)$/,"\\1","g")}'
}

function get_cpp_include_path() {
  local lines=
  ${NATIVE_CLANG} -x c++ -v -E /dev/null |& grep Xcode.app | grep -v ignoring | grep -v clang | grep -v /dev/null | gawk '{print $1}' | while read line; do lines=${lines}:$line; done
  echo $lines | gawk '{print gensub(/:(.+)$/,"\\1","g")}'
}
c_include_path=`get_c_include_path`
cpp_include_path=`get_cpp_include_path`

export C_INCLUDE_PATH=${c_include_path}
export CPLUS_INCLUDE_PATH=${cpp_include_path}
export CPATH=${CPLUS_INCLUDE_PATH}
export LD_LIBRARY_PATH=/usr/local/lib
export INCLUDE=/usr/local/include
