#### INSTALLATION

Clone the [repository.](https://github.com/jonmkoenig/microscripts)

```sh
git clone https://github.com/jonmkoenig/microscripts
```

For users of BASH and ZSH, an installation script is included to append the microscripts directory to your path.

```sh
cd microscripts
./install
```

If you aren't using BASH or ZSH you can add the directory to your path manually.

Next, source either your .bashrc or .zshrc depending on your shell.

```sh
source ~/.zshrc
```

#### USAGE
Each script is fairly different, so it would be best to review them individually to develop an understanding.

For example, the 'cloak' microscript takes an arbitrary number of arguments and appends each argument to a file. This is handy for adding to .gitignore files because it won't overwrite the file if it already exists.

```sh
cloak .gitignore '**/__pycache__' config.json

Opened .gitignore and appended:

- **/__pycache__  
- config.json
```
