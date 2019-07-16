
file(READ configure.ac CONFIGURE_AC_CONTENTS)
string(REGEX MATCH "AC_INIT\\(PyIlmBase,[ ]*([0-9]+).([0-9]+).([0-9]+)" DUMMY ${CONFIGURE_AC_CONTENTS})
set(PYILMBASE_VERSION_MAJOR ${CMAKE_MATCH_1})
set(PYILMBASE_VERSION_MINOR ${CMAKE_MATCH_2})
set(PYILMBASE_VERSION_PATCH ${CMAKE_MATCH_3})
set(PYILMBASE_VERSION       ${PYILMBASE_VERSION_MAJOR}.${PYILMBASE_VERSION_MINOR}.${PYILMBASE_VERSION_PATCH})
set(PYILMBASE_VERSION_API   ${PYILMBASE_VERSION_MAJOR}_${PYILMBASE_VERSION_MINOR})
string(REGEX MATCH "LIBTOOL_CURRENT=([0-9]+)" DUMMY ${CONFIGURE_AC_CONTENTS})
set(PYILMBASE_SOCURRENT ${CMAKE_MATCH_1})
string(REGEX MATCH "LIBTOOL_REVISION=([0-9]+)" DUMMY ${CONFIGURE_AC_CONTENTS})
set(PYILMBASE_SOREVISION ${CMAKE_MATCH_1})
string(REGEX MATCH "LIBTOOL_AGE=([0-9]+)" DUMMY ${CONFIGURE_AC_CONTENTS})
set(PYILMBASE_SOAGE ${CMAKE_MATCH_1})
math(EXPR PYILMBASE_SOVERSION "${PYILMBASE_SOCURRENT} - ${PYILMBASE_SOAGE}")
set(PYILMBASE_LIB_VERSION "${PYILMBASE_SOVERSION}.${PYILMBASE_SOAGE}.${PYILMBASE_SOREVISION}")
message(STATUS "Configure PyIlmBase Version: ${PYILMBASE_VERSION} Lib API: ${PYILMBASE_LIB_VERSION}")
unset(CONFIGURE_AC_CONTENTS)
