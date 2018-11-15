# colorspace
- all templates any project could be started from
- example:
  - config.source: ocio, nuke-default, spi-vfx
  - colorspace.name: rec709, arri, srgb, aces-1-0-3
  - colorspace.tape: gamma22, aces-cg, alexa-logcv3, rec709

# name convention of template file
`{config.source}.{colorspace.name}.{colorspace.tape}[...{preset-name}].toml`
