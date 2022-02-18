set -e
set -o pipefail

# Required to get coverage in lcov form
dart pub global activate coverage

# Required to remove certain files from coverage
dart pub global activate remove_from_coverage

# Run tests and generate lcov
dart test --coverage=coverage && pub run coverage:format_coverage --lcov --in=coverage --out=coverage/lcov.info --packages=.packages --report-on=lib

# Don't report coverage on `.g.` and `.freezed.` files
pub global run remove_from_coverage:remove_from_coverage -f coverage/lcov.info -r '.freezed.dart$'
pub global run remove_from_coverage:remove_from_coverage -f coverage/lcov.info -r '.g.dart$'
