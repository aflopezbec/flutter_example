#!/bin/bash

# Run tests with coverage
flutter test --coverage

# Generate HTML report
genhtml coverage/lcov.info -o coverage/html

# Open the HTML report in the default web browser
open coverage/html/index.html