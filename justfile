set shell := [ "pwsh.exe", "-c" ]

HOME := env_var("USERPROFILE")
CHECKVER := HOME + '\scoop\apps\scoop\current\bin\checkver.ps1'

@default:
  just --list

@checkver MANIFEST:
  {{CHECKVER}} ./bucket/{{MANIFEST}}.json

@checkall:
  {{CHECKVER}} -Dir ./bucket/

@upgrade MANIFEST:
  {{CHECKVER}} -u ./bucket/{{MANIFEST}}.json
