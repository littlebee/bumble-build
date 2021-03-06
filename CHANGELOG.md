## [1.2.3](https://github.com/littlebee/bumble-build.git/compare/1.2.2...1.2.3) (2018-04-23)


### Other Commits
* [dce3785](https://github.com/littlebee/bumble-build.git/commit/dce3785ede59f2b0c98a96f6f1d9151ea5ef5650) upgrade to latest bumble-docs to mitigate ES2015 preset issue

## [1.2.2](https://github.com/littlebee/bumble-build.git/compare/1.2.1...1.2.2) (2018-04-22)


### Other Commits
* [e6b674a](https://github.com/littlebee/bumble-build.git/commit/e6b674acac62ed30726843e5d25ef763c5364349) upgrade to latest bumble-docs to mitigate ES2015 preset issue

## [1.2.1](https://github.com/littlebee/bumble-build.git/compare/1.2.0...1.2.1) (2018-04-16)


### Other Commits
* [e2690d5](https://github.com/littlebee/bumble-build.git/commit/e2690d55f97acf2654840a454fe6bd6a657c8d86) upgrade bumble-docs to 0.9.1 (marked to 0.3.9) to appease github nanny bot

## [1.2.0](https://github.com/littlebee/bumble-build.git/compare/1.1.0...1.2.0) (2018-04-5)


### Other Commits
* [13ae3d9](https://github.com/littlebee/bumble-build.git/commit/13ae3d995283fe23069512eed20ad8dd79ea51af) update packages for react 16 support

## [1.1.0](https://github.com/littlebee/bumble-build.git/compare/1.0.0...1.1.0) (2017-06-18)
Adds default rule for compiling all *.cjsx or *.coffee files in src/ to lib/

## [1.0.0](https://github.com/littlebee/bumble-build.git/compare/0.6.6...1.0.0) (2017-06-17)


### Other Commits
* [486f374](https://github.com/littlebee/bumble-build.git/commit/486f37488fcb3e2d7b56433a9c1c2406b89e21c6) breaking change: switched from trying to host and extend custom webpack and gruntfile configs to just copying the boilerplate files down to project root

## [0.6.6](https://github.com/littlebee/bumble-build.git/compare/0.6.5...0.6.6) (2017-02-18)


### Other Commits
* [89a9c7b](https://github.com/littlebee/bumble-build.git/commit/89a9c7b28c702167271c9d2425610bfb701a7d95) upgrade bumble-test to 0.4.1

## [0.6.5](https://github.com/littlebee/bumble-build.git/compare/0.6.4...0.6.5) (2017-02-18)


### Other Commits
* [fea375f](https://github.com/littlebee/bumble-build.git/commit/fea375fbcf46fae8d49cfa48a8dabef56c73b986) upgrade bumble-test to 0.4.0

## [0.6.4](https://github.com/littlebee/bumble-build.git/compare/0.6.3...0.6.4) (2017-02-18)


### Other Commits
* [617459a](https://github.com/littlebee/bumble-build.git/commit/617459a87e90014864a833595e5a64c20b76beb6) add grunt task for coverage report

## [0.6.3](https://github.com/littlebee/bumble-build.git/compare/0.6.2...0.6.3) (2017-02-3)


### Other Commits
* [2806dd7](https://github.com/littlebee/bumble-build.git/commit/2806dd7035fbff735447c1c45ae9f27fc0723bd8) typo correction in last change log
* [0bafdec](https://github.com/littlebee/bumble-build.git/commit/0bafdec7307e4e9803540452e16480303edc5fa8) update grunt available task messaging to reflect change in not building docs by default

## [0.6.2](https://github.com/littlebee/bumble-build.git/compare/0.6.1...0.6.2) (2017-02-3)
updated dependencies

### Other Commits
* [0740543](https://github.com/littlebee/bumble-build.git/commit/07405431bd69d1039b2c2117b20a7a16225c360e) upgrade bumble-util to 0.2.1; add .bablerc

## [0.6.1](https://github.com/littlebee/bumble-build.git/compare/0.6.0...0.6.1) (2017-01-29)


### Other Commits
* [831e858](https://github.com/littlebee/bumble-build.git/commit/831e8589188b1cb431b07ad269c14fee29097f3c) do not clean docs dir on clean either

## [0.6.0](https://github.com/littlebee/bumble-build.git/compare/0.5.0...0.6.0) (2017-01-29)
No longer builds docs by default.

### Other Commits
* [f07a6a2](https://github.com/littlebee/bumble-build.git/commit/f07a6a2396197aed2856edfbd7d711d035918d72) do not build docs unless explicit

## [0.5.0](https://github.com/littlebee/bumble-build.git/compare/0.4.0...0.5.0) (2016-11-326)


### Other Commits
* [51f090b](https://github.com/littlebee/bumble-build.git/commit/51f090bf10fb746e8c0b3a6fbf7124fccc46528c) update bumble-docs to 0.5.0
* [db1009c](https://github.com/littlebee/bumble-build.git/commit/db1009cf7bebf048d030f7f7995bb0981eee213b) show example of how to override a single grunt config thing

## [0.4.0](https://github.com/littlebee/bumble-build.git/compare/0.3.6...0.4.0) (2016-11-325)


### Other Commits
* [12e9676](https://github.com/littlebee/bumble-build.git/commit/12e967655cd64b227754d0da3023efd318a6b230) cleanup - remove unneccesary presets on js/jsx remove console.log debugging
* [e516e14](https://github.com/littlebee/bumble-build.git/commit/e516e14c3fa1cf5124e80eeaf1163fce98ff1e20) simplify passing passing partial grunt config into BumbleBuild.gruntConfig
* [c1bd524](https://github.com/littlebee/bumble-build.git/commit/c1bd5246e348c193dc3b8cc5caf1d351183b8a12) support for user modified loaders and externals without having to repeat all of default config loaders and externals
* [47dc858](https://github.com/littlebee/bumble-build.git/commit/47dc85826975fdb5eae9a0731eb7b02eb9148784) lock down versions of installed dev packages to currently used by react-datum. remove unused var in init

## [0.3.6](https://github.com/littlebee/bumble-build.git/compare/0.3.5...0.3.6) (2016-05-123)
testing publish package

## [0.3.5](https://github.com/littlebee/bumble-build.git/compare/0.3.4...0.3.5) (2016-04-120)


### Other Commits
* [b1b203c](https://github.com/littlebee/bumble-build.git/commit/b1b203c5e4c41dc7ca59d4e3c5a6c99211622a0b) fix grunt version at 0.4.5 because 1.0 breaks several contrib packages dependencies

## [0.3.4](https://github.com/littlebee/bumble-build.git/compare/0.3.3...0.3.4) (2016-04-109)


### New Features
* [19a3f35](https://github.com/littlebee/bumble-build.git/commit/19a3f35d7ada8fef9156ced20f8e24d7b531f5ed)  adds default support for json loader

### Other Commits
* [909813d](https://github.com/littlebee/bumble-build.git/commit/909813dffc5885fb43c72aa025542af3516a85a8) update bumble-docs to latest

## [0.3.3](https://github.com/littlebee/bumble-build.git/compare/0.3.2...0.3.3) (2016-04-107)


### Bugs Fixed in this Release
* [106e37c](https://github.com/littlebee/bumble-build.git/commit/106e37c94c3c1fd6d36feecebcfc982e25a2adb9)  fix issues with requiring user webpack config

## [0.3.2](https://github.com/littlebee/bumble-build.git/compare/0.3.1...0.3.2) (2016-04-107)


### Other Commits
* [4007cd1](https://github.com/littlebee/bumble-build.git/commit/4007cd155208c2e33367ae5226af646c29357700) update version of bumble-docs to latest

## [0.3.1](https://github.com/littlebee/bumble-build.git/compare/0.3.0...0.3.1) (2016-04-102)


### Other Commits
* [419c1c3](https://github.com/littlebee/bumble-build.git/commit/419c1c3971b2d2617098636311660c4bd8df83ad) correct underscore inclusion in webpack config

## [0.3.0](https://github.com/littlebee/bumble-build.git/compare/0.2.4...0.3.0) (2016-03-66)


### Other Commits
* [4c51f79](https://github.com/littlebee/bumble-build.git/commit/4c51f793fedf54303616f5586f8be05b790856c3) change name of deploy script

## [0.2.4](https://github.com/littlebee/bumble-build.git/compare/0.0.0...0.2.4) (2016-03-66)


### Other Commits
* [b95997f](https://github.com/littlebee/bumble-build.git/commit/b95997f1f1f0ef5ee9b5ff627f575d949f45a35d) add coffee and cjsx loaders
