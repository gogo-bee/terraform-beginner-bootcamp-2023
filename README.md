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


### Working with Env vars

### `env` comman

We can list out all the Environment Variables (Env Vars) using the `env` command

We can filter specific env vars using grep e.g `env | grep GITPOD_`


### Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO='world`

In the terminal we can unset using `unset HELLO`

We can set an env var temporarily when just running a command

```sh
HELLO='world' ./bin/print_message
```
Within a bash script we can set env var without writing export e.g

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```
#### Printing Env Vars

We can print an env var using echo eg `echo $HELLO`

#### Scoping of Env Vars

When you open up new bash terminals in GITPOD it will not be aware of env vars that you have set in another window.

If you want env vars to persist across all future bash terminals that are open you need to set Env Vars in your bash profile. eg `bash_profile`


#### Persisting Env Vars in Gitpod

We can persist env vars in gitpod by storing them in Gitpod secrets storage.

```
gp env HELLO='world'
```

All future workspaces launced will set the env vars for all the bash terminals opened in those workspaces.

You can also set env vars in the `.gitpod.yml` but this can only contain non-sensitive env vars


### AWS CLI Installation

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

[Getting Started Install(AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)
We can check if our AWS credentials is configured correctly by running the following AWS CLI command:

```sh
aws sts get-caller-identity
```

If it is succesful you should see a json payload that looks like this 

```json
{
    "UserId": "AIEA5A3Z5VFMUEB9TWL2G",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform-beginner-bootcamp"
}
```
This is supposed to match your AWS credentials in your management console.

We'll need to generate AWS CLI credentials from IAM User in order to use the AWS CLI.