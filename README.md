#### INSTALLATION

Clone the [repository.](https://github.com/jonmkoenig/microscripts)

```sh
git clone https://github.com/jonmkoenig/microscripts
```

For users of BASH and ZSH, an installation script is included to append the microscripts directory to end of your shell path.

```sh
./microscripts/install
```

If you aren't using BASH or ZSH you can add the directory to your path manually.

#### USAGE
Each script is fairly different, so it would be best to review them individually to develop an understanding.

For example, the 'cloak' microscript takes an arbitrary number of arguments and appends each argument to a file. This works well for quickly generating or adding to .gitignore files because it won't overwrite anything if the file already exists.

```sh
cat .gitignore

secrets.txt

cloak .gitignore '**/__pycache__' config.json

Opened .gitignore and appended:

- **/__pycache__  
- config.json

cat .gitignore

secrets.txt  
**/__pycache__  
config.json
```
