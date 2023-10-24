# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going to utilize semantic versioning for its tagging.
[semver.org](https://semver.org/)

The general format:

 **MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install the Terraform CLI

### Considerations with the Terraform CLI changes  
The Terraform CLI installation instructions have changed due to gpg keyring changes. We neede to refer to the latest install CLI instructions via Terraform documentation and change the scripting for install.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux distribution

This project is built against Ubuntu. Please consider checking your Linux Distribution and change accordingly to distribution needs.

[How to check OS version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example of checking OS version

```
$ cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```


### Refactoring into Bash Sctipts

While fixing Terraform CLI gpg deprecation issues, we noticed the bash script steps were a considerable amount more code. So we decided tocreate a bash script to install the Terraform CLI.

This bash script is located here: [./bin/install_terraform_cli](./bin/install_terraform_cli)


- This will keep the Gitpod task file ([.gitpod.yml](.gitpod.yml))tidy
- This will allow us an easier time to debug and execute manually Terraform CLI install
- This will allow better portability for other projects that need to install Terraform CLI

#### Shebang Considerations

A Shebang (pronounced sha-bang) tells the bash script what program that will interpret the script eg `#!/bin/bash`

ChatGPT recommended we use this format for bash: `#!/usr/bin/env bash`

- For portability for different OS distributions 
- Will search the Users PATH for the bash executable 

https://en.wikipedia.org/wiki/Shebang_(Unix)


#### Execution Considerations

When executing script we can use the shorthand notation `./` to execute the bash script.

eg `./bin/install_terraform_cli`

If we are using a script in .gitpod.yml we need to point the script to a program to interpret it. eg `source ./bin/install_terraform_cli` 


#### Linux Permissions Consideration

In order to make our bash script executable we need to change the linux permissions for the file to be executable at the user mode.

```sh
chmod u+x ./bin/install_terraform_cli
```

Alternatively:
```sh
chmod 744 ./bin/install_terraform_cli
```



https://en.wikipedia.org/wiki/Chmod

### Github Lifecycle (Before, Init, command)

We need to be careful when the Init because it will not rerun if we restart an existing workspace. 

https://www.gitpod.io/docs/configure/workspaces/tasks