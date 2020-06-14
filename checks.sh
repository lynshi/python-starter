#!/bin/bash

# Change these parameter values.
MAIN="main.py"
PACKAGES="sample"
REQUIRED_CODE_COVERAGE=100
UNIT_TEST_DIRECTORY="test"

# For coloring terminal output.
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0;0m'  # no color

echo -e "${BLUE}Running unit tests...${NC}"
coverage run --source $PACKAGES --branch -m pytest $UNIT_TEST_DIRECTORY
if [ $? -ne 0 ]
then
    echo -e "${RED}Unit tests failed.${NC}"
    exit 1
fi
echo -e "${GREEN}Unit tests passed!${NC}"

report=$(coverage report)
coverage=${report: -4}
coverage="${coverage//\%/}"
coverage="${coverage//\ /}"
if [ $coverage -lt $REQUIRED_CODE_COVERAGE ]
then
    echo -e "${RED}Insufficient code coverage: ${coverage}% / ${REQUIRED_CODE_COVERAGE}%${NC}"
    exit 1
fi
echo -e "${GREEN}Sufficient code coverage (${coverage}% / ${REQUIRED_CODE_COVERAGE}%)!${NC}"

echo -e "${BLUE}Static type check with pyright...${NC}"
pyright
if [ $? -ne 0 ]
then
    echo -e "${RED}Static type check failed.${NC}"
    exit 1
fi
echo -e "${GREEN}Static type check passed!${NC}"

echo -e "${BLUE}Formatting code with black...${NC}"
black $PACKAGES $MAIN $UNIT_TEST_DIRECTORY
echo -e "${GREEN}Done formatting code!${NC}"

echo -e "${BLUE}Linting source with pylint...${NC}"
pylint $PACKAGES $MAIN
if [ $? -ne 0 ]
then
    echo -e "${RED}Linting failed.${NC}"
    exit 1
fi

echo -e "${BLUE}...linting tests with pylint...${NC}"
pylint --disable=duplicate-code $UNIT_TEST_DIRECTORY
if [ $? -ne 0 ]
then
    echo -e "${RED}Linting failed.${NC}"
    exit 1
fi

echo -e "${GREEN}Linting done!${NC}"

echo -e "All checks passed! :)"