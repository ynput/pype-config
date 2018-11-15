# studio-templates
directory: pipeline, conventions, colorspace, dataflow
file format: toml

All the information specific to a studio environment should be kept within this repository. Environments, folder templates, software configs, color profiles, etc...

- the basic layer of studio-oriented configs written in *.toml
- each of *.toml file's name convention is holding also a preset name for example "mongo...My-testing.toml"
- examples of keys:  mongo-server-ip, mongo-server-user, mongo-server-passwords, ftrack-server-ip, ftrack-server-user, ftrack-server-password, ftrack-api-key, studio-storage-locations (ftrack's locations concept fork),
- if no "..." then it is default settings
- if the launcher is having configuration preset defined then all default setting are read first. If any file with preset matched it will overwrite the already defined keys
- directiries: pipeline, conventions, colorspace, data-flow

`pipeline/mongo.toml:`
```toml
[server]
  ip='127.0.0.1'
  ports=[5000,5010]
  user='user'
  password='user123'
```

`pipeline/mongo...My-testing.toml:`
```toml
[server]
  user='user2'
  password='user12358'
```

`resulting config values: `
```toml
[server]
  ip='127.0.0.1'
  ports=[5000,5010]
  user='user2'
  password='user12358'
```
