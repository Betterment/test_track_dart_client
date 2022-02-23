set -e
set -o pipefail

if [ -z "$1" ]
  then
    echo "Must include coverage file name"
    exit 1
fi

# Required to get coverage in lcov form
dart pub global activate coverage

# Required to remove certain files from coverage
dart pub global activate remove_from_coverage

# Run tests and generate lcov
dart test --coverage=coverage && pub run coverage:format_coverage --lcov --in=coverage --out=coverage/$1 --packages=.packages --report-on=lib

# Don't report coverage on `.g.` and `.freezed.` files
dart pub global run remove_from_coverage:remove_from_coverage -f coverage/$1 -r '.freezed.dart$' -r '.g.dart$' -r '^.*/factories/.*_factory.dart$' -r '.*/helpers/pair.dart$'
