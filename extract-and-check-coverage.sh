#!/bin/bash

min_coverage=100

# Path to the HTML file
HTML_FILE="coverage/index.html"

# Extract the first occurrence of the percentage using grep, sed, and awk
COVERAGE=$(grep -oP '(?<=<span class="strong">)[0-9]+(?=%)' "$HTML_FILE" | head -n 1)

# Check if a value was extracted
if [ -z "$COVERAGE" ]; then
  echo "Could not extract coverage percentage."
  exit 1
else
  echo "Extracted Coverage: $COVERAGE%"
fi

# Compare the extracted coverage with the minimum threshold
if [ "$COVERAGE" -ge "$min_coverage" ]; then
  echo "Coverage meets the minimum threshold of $min_coverage%."
  exit 0
else
  echo "Coverage ($COVERAGE%) is below the minimum threshold of $min_coverage%. Failing."
  exit 1
fi