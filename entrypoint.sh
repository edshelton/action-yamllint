#!/usr/bin/env bash

echo "======================"
echo "= Linting YAML files ="
echo "======================"

if [ -z "$INPUT_FILE_OR_DIR" ]; then
    echo "file_or_dir not provided, add it in workflow"
    exit 1
fi

STRICT=""
if [ "$INPUT_STRICT" == "true" ]; then
  STRICT="-s"
fi

if [ -n "$INPUT_CONFIG_FILE" ]; then
  CONFIG_FILE="-c $INPUT_CONFIG_FILE"
fi

if [ -n "$INPUT_CONFIG_DATA" ]; then
  CONFIG_DATA="-d $INPUT_CONFIG_DATA"
fi

if [[ -n "$INPUT_NO_WARNINGS" && "$INPUT_NO_WARNINGS" != "false" ]]; then
  NO_WARNINGS="--no-warnings"
fi

if [ -n "$INPUT_FORMAT" ]; then
  FORMAT="-f $INPUT_FORMAT"
fi

yamllint $CONFIG_FILE $CONFIG_DATA $FORMAT $STRICT $NO_WARNINGS $INPUT_FILE_OR_DIR
