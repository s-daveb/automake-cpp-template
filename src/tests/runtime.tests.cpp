/* test-frameworks.cpp
 * Copyright © 2018-2022 Saul D. Beniquez
 * License: Mozilla Public License v. 2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 License, v. 2.0. If a copy of the MPL was not distributed with this
 file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#include "test-includes.hpp"

#include <boost/lexical_cast.hpp>

using fakeit::Mock;
using fakeit::When;

class SomeInterface
{
    public:
	virtual int foo(int) = 0;
	virtual int bar(char*)= 0;
};

TEST_CASE("Catch2 works with Fakeit", "[integrity-check]")
{
	Mock<SomeInterface> mock_obj;
	Mock<SomeInterface> other_obj;

	// Use the preprocessor and template generator to create
	// two implementations of SomeInterface
	When(Method(mock_obj, foo)).Return(1);   // returns 1 once
	When(Method(other_obj, foo)).Return(-1); //  returns 0 once

	// Get an instance of the generated mock class
	auto& iface = mock_obj.get();

	REQUIRE(iface.foo(0) == 1);

	auto& otheriface = other_obj.get();
	REQUIRE(otheriface.foo(0) == -1);
}

// #region seraization test setup
//struct DataRecord
//{
//	id_t id;
//	std::string name;
//
//	bool operator==(const DataRecord& rhs) const
//	{
//		return (this->id == rhs.id) && (this->name == rhs.name);
//	}
//
//	NLOHMANN_DEFINE_TYPE_INTRUSIVE(DataRecord, id, name)
//};
//struct DataRecordCollection
//{
//	std::unordered_map<id_t, DataRecord> collection;
//
//	NLOHMANN_DEFINE_TYPE_INTRUSIVE(DataRecordCollection, collection)
//
//};

/*TEST_CASE("serizalization works as expected", "[integrity-check]")
{
	DataRecord testRecord;
	DataRecord expectedResult{ .id = 52, .name = "expected" };

	json json_object = expectedResult;
	std::string json_string = json_object.dump(4);

	// print out the generated json so we can see it when the test runs
	std::cout << json_string << std::endl;

	auto from_string = json::parse(json_string);
	testRecord = from_string.get<DataRecord>();

	REQUIRE(expectedResult == testRecord);
}*/
// #endregion

// clang-format off
// vim: set foldmethod=marker foldmarker=#region,#endregion textwidth=80 ts=8 sts=0 sw=8  noexpandtab ft=cpp.doxygen :
