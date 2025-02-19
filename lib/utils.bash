#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/elixir-protobuf/protobuf"
TOOL_NAME="protoc-gen-elixir"
TOOL_TEST="protoc-gen-elixir --version"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//'
}

list_all_versions() {
	list_github_tags
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	(
		asdf current erlang >/dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "An asdf erlang version has already been selected; I'll use that to build $TOOL_NAME."
		else
			fail "No asdf erlang version is selected"
		fi

		asdf current elixir >/dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "An asdf elixir version has already been selected; I'll use that to build $TOOL_NAME."
		else
			fail "No asdf elixir version is selected"
		fi

		mix escript.install hex protobuf "$version"

		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
