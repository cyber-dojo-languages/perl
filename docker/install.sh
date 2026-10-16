#!/bin/sh -eu

# Records the Perl this image holds, in the shape every image shares. The
# installed interpreter is asked, so the version is one the image can run
# rather than one written down when someone last edited this file. %vd prints
# $^V as plain dotted numbers, without its leading v.
readonly LANGUAGE_VERSION=$(perl -e 'printf q{%vd}, $^V')

if [ -z "${LANGUAGE_VERSION}" ]; then
  echo 'Could not read a version from $^V' >&2
  exit 1
fi

cat > /versions.json <<EOF
{
  "language": {
    "name": "Perl",
    "version": "${LANGUAGE_VERSION}"
  },
  "test_frameworks": []
}
EOF
