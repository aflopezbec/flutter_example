#!/bin/bash

# Run tests with coverage
flutter test ../test --coverage

# add ../ to the path of the lcov.info file
sed -i '' 's|SF:lib|SF:../lib|g' ../coverage/lcov.info

# Generate HTML report
genhtml ../coverage/lcov.info -o ../coverage/html 

# Open the HTML report in the default web browser
open ../coverage/html/index.html