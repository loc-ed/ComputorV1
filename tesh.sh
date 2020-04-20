#!/bin/zsh

echo "SPECIAL : 5 * X^0 = 5 * X^0"
ruby computor.rb  "5 * X^0= 5 * X^0"
echo "\n"

echo "IMPOSSIBLE : 4 * X^0 = 8 * X^0"
ruby computor.rb  "4 * X^0= 8 * X^0"
echo "\n"

echo "LINEAR && FRACTIONS: 5.1 * X^0 = 4 * X^0 + 7.3 * X^1"
ruby computor.rb  "5.1 * x^0 = 4 * x^0 + 7.3 * x^1"
echo "\n"

echo "DIS POS : 5 * X^0 + 13.1 * X^1 + 3 * X^2 = 1 * X^0 + 1 * X^1"
ruby computor.rb  "5 * x^0 + 13.1 * x^1 + 3 * x^2 = 1 * x^0 + 1 * x^1"
echo "\n"

echo "DIS ZERO : - 4 * X^2 - 12 * X^1 - 5 * X^0 = 4 * X^0"
ruby computor.rb  "4 * x^2 + 49 * x^0 = 28 * x^1"
echo "\n"

echo "DIS NEG && ZERO COEFFICIENT : 5 * X^0 + 3 * X^1 + 3 * X^2 = 1 * X^0 + 0 * X^1"
ruby computor.rb  "5 * x^0 + 3 * x^1 + 3 * x^2 = 1 * x^0 + 0 * x^1"
echo "\n"

# echo "NEGATIVE VAR : - 5 * X^0 + 13.1 * X^1 + 3 * - X^2 = 1 * X^0 + X"
# ruby computor.rb  "5 * - x^0 + 13.1 * x^1 + 3 * - x^2 = 1 * X^0 + X"
# echo "\n"

# echo "LONELY VAR : - 5 * X^0 + 13.1 * X^1 + 3 * - X^2 = X^0 + X"
# ruby computor.rb  "5 * - X^0 + 13.1 * X^1 + 3 * - X^2 = 1 * X^0 + X"
# echo "\n"

# echo "MISSING EXPONENENT : 5 * - X^0 + 13.1 * X + 3 * - X^2 = 1 * X^0 + X"
# ruby computor.rb  "5 * - X^0 + 13.1 * X^1 + 3 * - X^2 = 1 * X^0 + X"
# echo "\n"

# echo "MULTIPLE VAR : - 4 * X^2 - 1 * Y^1 - 12 * X^1 - 5 * X^0 = 4 * X^0 - 1 * Y^1"
# ruby computor.rb  "- 4 * X^2 - 1 * Y^1 - 12 * X^1 - 5 * X^0 = 4 * X^0 - 1 * Y^1"
# echo "\n"

# echo "ZERO COEFFICIENT: 0 * X^0 + 0 * X^1 + 3 * X^2 = 1 * X^0 + 0 * X^1"
# ruby computor.rb  "0 * X^0 + 0 * X^1 + 3 * X^2 = 1 * X^0 + 0 * X^1"
# echo "\n"
