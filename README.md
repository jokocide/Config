#### INSTALLATION

Clone the repository and add it to your $PATH.

```sh
git clone https://github.com/jonmkoenig/microscripts ~/bin/microscripts

./microscripts/install
```

#### EXAMPLE

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
