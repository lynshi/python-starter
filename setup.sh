#!/bin/bash
BLUE='\033[0;34m'
NC='\033[0;0m'

echo -e "${BLUE}Installing pyright...${NC}"
npm install -g pyright

echo -e "${BLUE}Installing from requirements.txt...${NC}"
pip install -r requirements.txt