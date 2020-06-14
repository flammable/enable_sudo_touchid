#!/bin/bash

basename="/usr/bin/basename"
cp="/bin/cp"
makepkginfo="/usr/local/munki/makepkginfo"
mkdir="/bin/mkdir"
PlistBuddy="/usr/libexec/PlistBuddy"

munki_repo="/Volumes/munki_repo"

# Check for Munki repository
if [ ! -d ${munki_repo} ]; then
 ${echo} "Munki repository file share not found, please mount and retry."
 exit 1
fi

# Name of the pkg, based on the parent directory
pkg_name="$(${basename} ${PWD})"

# Version number of the pkg
pkg_version="1.0"

# If build directory doesn't exist, create it
if [ ! -d ./build ]; then
 ${mkdir} ./build
fi

# Generate nopkg
${makepkginfo} \
--nopkg \
--name "${pkg_name}" \
--pkgvers="${pkg_version}" \
--displayname "Enable Touch ID for sudo" \
--description "Enables Touch ID for the sudo and su commands in the Terminal." \
--category "Scripts" \
--developer "Your Org" \
--minimum_os_version "10.14" \
--installcheck_script ./munki_installcheck_script.sh \
--postinstall_script ./munki_postinstall_script.sh \
--unattended_install \
> ./build/"${pkg_name}"-"${pkg_version}".plist

# Copy to Munki repository
${cp} -v ./build/"${pkg_name}"-"${pkg_version}".plist "${munki_repo}"/pkgsinfo/scripts/

exit
