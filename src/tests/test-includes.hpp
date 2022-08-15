/* test-includes.hpp
 * Copyright © 2020-2022 Saul D. Beniquez
 * License: Mozilla Public License v. 2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 License, v. 2.0. If a copy of the MPL was not distributed with this
 file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#pragma once

#include <catch2/catch_test_macros.hpp>
#include <fakeit.hpp>

#define BEGIN_TEST_SUITE(name)\
	namespace {\
	const char* TEST_SUITE_NAME = "[" name "]";

#define END_TEST_SUITE }

#define FIXTURE_CASE(testname)\
	TEST_CASE_METHOD(TestFixture, #testname, TEST_SUITE_NAME)

#ifdef VIM_COMPLETION
#define UNIT_TEST
#endif
// clang-format off
// vim: set foldmethod=marker foldmarker=#region,#endregion textwidth=80 ts=8 sts=0 sw=8  noexpandtab ft=cpp.doxygen :
