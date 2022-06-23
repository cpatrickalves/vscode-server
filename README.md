# vscode-server

A setup to run VScode remotely.

This is the same version of [code-server](https://github.com/coder/code-server) with some aditional packages to improve my own development environment.

Check `Dockefile` to see the changes.

### Getting started

* First change the password required for authentication on `config/code.cfg` file.

* To start this server just run docker-compose including UID, GID during compose stack up and down to keep same permissions on files created.

```UID=$UID GID=$GID docker-compose up -d```

```UID=$UID GID=$GID docker-compose down```


### To do
- Add traefik to access using code.domain.com
- Add extensions
