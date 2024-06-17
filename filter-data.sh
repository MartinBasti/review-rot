#!/bin/bash
set -euo pipefail

authors='[
  "MartinBasti",
  "tkdchen",
  "chmeliik",
  "brunoapimentel",
  "stuartwdouglas",
  "mmorhun",
  "mkosiarc",
  "rcerven",
  "tisutisu",
  "taylormadore",
  "ben-alkov",
  "lkolacek",
  "eskultety",
  "slimreaper35",
  "ianrochapg"
]'

bots='[
  "dependabot[bot]",
  "renovate[bot]",
  "rh-tap-build-team[bot]"
]'


# Assumes data from stdin!
jq --argjson authors "${authors}" --argjson bots "${bots}" -r '[
    .[] | select(
        ([.user] | inside($authors)) or
        (.url | contains("/build-team/")) or
        (
	  ([.user] | inside($bots)) and
	  (.url | test ("build-definitions|build-service|cachi2|cachito|atomic-reacotr|osbs-client|dockerfile-parse|koji-containerbuild|osbs-docs|pyarn|ansible-role"))
        )
    )
]'
