#### Installation:

Clone the repository and add it to your $PATH. An installation script is included for typical shells like BASH and ZSH.

```sh
git clone https://github.com/jonmkoenig/microscripts ~/bin/microscripts

cd $_

./install
```

#### Example from the 'cloak' script:

```sh
cloak .gitignore '**/__pycache__' config.json

Opened .gitignore and appended:
	- **/__pycache__
	- config.json

cat .gitignore

**/__pycache__
config.json
```
