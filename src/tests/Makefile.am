TESTS=
check_PROGRAMS+= app-test
TESTS+=$(check_PROGRAMS)

tests_c_flags=
tests_c_flags+= -I ${srcdir}/src/tests
tests_c_flags+= -I ${srcdir}/third_party/FakeIt/include -I ${srcdir}/third_party/FakeIt/config/catch
tests_c_flags+= $(CATCH2_CFLAGS)

# Ignore errors that are usually coming from the testing frameworks themselves
test_disabled_warnings=-Wno-deprecated-declarations -Wno-defaulted-function-deleted\
				  -Wno-zero-length-array

app_test_SOURCES=
app_test_LDADD=
app_test_CXXFLAGS=
app_test_CPPFLAGS=
app_test_SOURCES+=src/tests/runtime.tests.cpp


app_test_CXXFLAGS+= ${AM_CXXFLAGS} ${test_disabled_warnings}
app_test_CPPFLAGS+= $(AM_CPPFLAGS) $(PROJECT_INCLUDE_FLAGS)
app_test_CPPFLAGS+= $(tests_c_flags)
app_test_CPPFLAGS+= -DUNIT_TEST=1

app_test_LDADD+= $(CATCH2_LIBS)
#app_test_LDADD+=$(SDL2_LIBS) $(NLOHMANN_JSON_LIBS)

