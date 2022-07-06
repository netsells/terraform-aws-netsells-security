#!/usr/bin/env bash

# Run this from the project root

terraform-docs markdown table --header-from ./docs/readme-header.md . > README.md
