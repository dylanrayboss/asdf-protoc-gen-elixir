<div align="center">

# asdf-protoc-gen-elixir [![Build](https://github.com/dylanrayboss/asdf-protoc-gen-elixir/actions/workflows/build.yml/badge.svg)](https://github.com/dylanrayboss/asdf-protoc-gen-elixir/actions/workflows/build.yml) [![Lint](https://github.com/dylanrayboss/asdf-protoc-gen-elixir/actions/workflows/lint.yml/badge.svg)](https://github.com/dylanrayboss/asdf-protoc-gen-elixir/actions/workflows/lint.yml)

[protoc-gen-elixir](https://github.com/elixir-protobuf/protobuf) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add protoc-gen-elixir
# or
asdf plugin add protoc-gen-elixir https://github.com/dylanrayboss/asdf-protoc-gen-elixir.git
```

protoc-gen-elixir:

```shell
# Show all installable versions
asdf list-all protoc-gen-elixir

# Install specific version
asdf install protoc-gen-elixir latest

# Set a version globally (on your ~/.tool-versions file)
asdf global protoc-gen-elixir latest

# Now protoc-gen-elixir commands are available
protoc-gen-elixir --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/dylanrayboss/asdf-protoc-gen-elixir/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [dylan](https://github.com/dylanrayboss/)
