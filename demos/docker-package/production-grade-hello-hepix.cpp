#include <iostream>

#include <boost/format.hpp>
#include <boost/functional/value_factory.hpp>
#include <boost/log/trivial.hpp>

class Printable
{
	virtual char const* get_value() const = 0;
	friend std::ostream& operator<<(std::ostream&, Printable const&);
};

std::ostream& operator<<(std::ostream& os, Printable const& printable)
{
	return os << printable.get_value();
}

constexpr char const* const CONFERENCE_NAME_VALUE = "HEPiX";
class ConferenceName : public Printable
{
	char const* get_value() const override { return CONFERENCE_NAME_VALUE; }
};

constexpr char const* const CONFERENCE_DATE_VALUE = "2024";
class ConferenceDate : public Printable
{
	char const* get_value() const override { return CONFERENCE_DATE_VALUE; }
};

int main(int const argc, char const* const* const argv)
{
	if (argc != 1) {
		BOOST_LOG_TRIVIAL(error) << boost::format("%s takes no arguments.") % argv[0];
		return 1;
	}

	auto const conference_name_factory = boost::value_factory<ConferenceName>();
	auto const conference_date_factory = boost::value_factory<ConferenceDate>();

	BOOST_LOG_TRIVIAL(info) << boost::format("Hello, %s %s") % conference_name_factory() %
	                             conference_date_factory();

	return 0;
}
