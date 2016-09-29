# Version Embedding

Method to automatically version releases in C/C++ utilising Makefiles.

When compiling with make, the following information is
obtained & embedded inside the output program.

* Git version, obtained from the latest tag e.g. `v1.0.1`
* Specific commit of the latest tag, e.g. `19c31278502e5693f5b530e798d10e10893090d7`
* Latest tag commit date as ISO-8601 valid date, e.g. `2016-09-29T20:13:34+13:00`
* Build date, e.g. `2016-09-29T21:04:55+13:00`

## Example Output

```shell
GIT VERSION - v1.0.1
GIT COMMIT  - 19c31278502e5693f5b530e798d10e10893090d7
GIT DATE    - 2016-09-29T20:13:34+13:00
BUILD DATE  - 2016-09-29T21:04:55+13:00
```

## License

The MIT License ([MIT](LICENSE.md))
