# metadata
- initial project data: fps, format, first_frame, sequence_pading, studio_name
- data are hiearchically inheritable
- these metadata could be overwritten by a defined project and its child objects, example: `studio-projects/<project_name>/templates/metadata/ep-##_sq-##_sh-##.toml`
- name of file ideally corresponds to anatomy template file

# name convention of template file
`{production.workflow}[...{preset-name}].toml`
