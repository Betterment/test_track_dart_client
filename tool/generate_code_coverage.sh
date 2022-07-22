set -e
set -o pipefail

# Required to get coverage in lcov form
dart pub global activate coverage

# Required to remove certain files from coverage
dart pub global activate remove_from_coverage

# Run tests and generate lcov
dart test --coverage=coverage && dart run coverage:format_coverage --lcov --in=coverage --out=coverage/lcov.info --report-on=lib

# Don't report coverage on `.g.` and `.freezed.` files
dart pub global run remove_from_coverage:remove_from_coverage -f coverage/lcov.info -r '.freezed.dart$' -r '.g.dart$' -r '^.*/factories/.*_factory.dart$' -r '.*/helpers/pair.dart$'
