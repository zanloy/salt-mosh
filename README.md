# Salt-Mosh

This is a salt state module to install [mosh](https://mosh.mit.edu/) on a server.

# Usage:

To install mosh, add the following to your top.sls:

```
include:
  - mosh
```

To install mosh once, you can run the following command:

```
salt '*' state.sls mosh
```
