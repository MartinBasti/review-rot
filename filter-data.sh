#!/bin/bash
set -euo pipefail

authors='[
  "MartinBasti",
  "Josh-Everett",
  "jencull",
  "kasemAlem",
  "dirgim",
  "hongweiliu17",
  "dheerajodha",
  "sonam1412",
  "jsztuka",
  "14rcole",
  "hacbs-test-bot",
  "dependabot[bot]",
  "renovate[bot]"
]'

# Assumes data from stdin!
jq --argjson authors "${authors}" -r '[
    .[] | select(
        ([.user] | inside($authors)) or
        (.url | contains("/test-team/"))
    )
]'
