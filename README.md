<img src="https://raw.githubusercontent.com/gabyx/githooks/main/docs/githooks-logo.svg" style="margin-left: 20pt" align="right">

# Githooks for Configuration Files

This repository contains shared repository Git hooks for shell scripts in
`githooks/*` to be used with the
[Githooks Manager](https://github.com/gabyx/Githooks).

The following hooks are included:

- Hook to format configuration files `.yaml, .toml, .json` files with `prettier`
  (pre-commit).

<details>
<summary><b>Table of Content (click to expand)</b></summary>

<!-- TOC -->

- [Githooks for Configuration Files](#githooks-for-configuration-files)
  - [Requirements](#requirements)
  - [Installation](#installation)
  - [Hook: `pre-commit/1-format/format-configs.yaml`](#hook-pre-commit1-formatformat-configsyaml)
  - [Scripts](#scripts)
  - [Testing](#testing)

</details>

## Requirements

Run them
[containerized](https://github.com/gabyx/Githooks#running-hooks-in-containers)
where only `docker` is required.

If you want to run them non-containerized, make the following installed on your
system:

- [`prettier`](https://prettier.io/docs/en/install.html) (optional
  [`prettierd`](https://github.com/fsouza/prettierd)
- [`prettier-plugin-toml`]()<https://github.com/bd82/toml-tools/tree/master/packages/prettier-plugin-toml)>
- `bash`
- GNU `grep`
- GNU `sed`
- GNU `find`
- GNU `xargs`
- GNU `parallel` _[optional]_

This works with Windows setups too.

## Installation

The hooks can be used by simply using this repository as a shared hook
repository inside shell projects.
[See further documentation](https://github.com/gabyx/githooks#shared-hook-repositories).

You should configure the shared hook repository in your project to use this
repos `main` branch by using the following `.githooks/.shared.yaml` :

```yaml
version: 1
urls:
  - https://github.com/gabyx/githooks-configs.git@main`.
```

## Hook: `pre-commit/1-format/format-configs.yaml`

Formatting with `prettier`.

## Scripts

The following scripts are provided:

- [`format-configs-all.sh`](githooks/scripts/format-configs-all.sh) : Script to
  format all doc files in a directory recursively. See documentation.

```shell
shellHooks=$(git hooks shared root ns:githooks-docs)
"$shellHooks/githooks/scripts/<script-name>.sh"
```

## Testing

The containerized tests in `tests/*` are executed by

```bash
tests/test.sh
```

or only special tests steps by

```bash
tests/test.sh --seq 001..010
```

For showing the output also in case of success use:

```bash
tests/test.sh --show-output [other-args]
```
