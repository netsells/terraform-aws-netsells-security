#!/usr/bin/env bash

# Run this from the project root

terraform-docs markdown table --lockfile=false --header-from ./docs/readme-header.md . > README.md
