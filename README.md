# Elm I18n Example

An example implementation of runtime language switching using [Elm][].

It re-implements [Tachyons][]'
[Full Screen Centered Title component documentation page][] in Elm, adds a
language dropdown menu, and allows you to switch the language of the message
displayed.

## Blog Posts

This project was initially created as part of a blog post I wrote:

- _[Runtime Language Switching in Elm][]_

The post references the example when it was using Elm 0.18, so that application
state is preserved in the [0.18 branch][].

The `master` branch runs the application using Elm 0.19.1.

The tests were created as part of another blog post I wrote about using
[Cypress][]:

- _[A Canvas of Cypress Tests][]_

You can find the Cypress integration test suite for this application
[here][paulfioravanti#cypress-i18n-example].

## Presentation

I did a talk about this project at the [Elm Sydney Meetup][] on
[21 June 2018][elm-sydney-20180621] ([slide deck][speakerdeck]).

## Setup

```sh
git clone https://github.com/paulfioravanti/elm-i18n-example.git
cd elm-i18n-example
npm install
```

## Run Server

```sh
elm-app start
```

## Run Review

This repo uses [elm-review][] via [elm-review CLI][] to check coding standards.

```sh
npx elm-review
```

## Deployment

Deployed to [Github Pages][] using [gh-pages][] at
<https://www.paulfioravanti.com/elm-i18n-example/>.

### Pre-requisites

```sh
npm install --global gh-pages
```

### Deploy

See [`push`][] file for details.

```sh
./push
```

[0.18 branch]: https://github.com/paulfioravanti/elm-i18n-example/tree/0.18
[A Canvas of Cypress Tests]: https://www.paulfioravanti.com/blog/canvas-of-cypress-tests/
[Cypress]: https://www.cypress.io/
[Elm]: http://elm-lang.org/
[elm-review]: https://github.com/jfmengels/elm-review
[elm-review CLI]: https://github.com/jfmengels/node-elm-review
[Elm Sydney Meetup]: https://www.meetup.com/Sydney-Elm-Meetup/
[elm-sydney-20180621]: https://www.meetup.com/Sydney-Elm-Meetup/events/pdpzvmyxjbcc/
[Full Screen Centered Title component documentation page]: http://tachyons.io/components/layout/full-screen-centered-title/index.html
[gh-pages]: https://github.com/tschaub/gh-pages
[Github Pages]: https://pages.github.com/
[paulfioravanti#cypress-i18n-example]: https://github.com/paulfioravanti/cypress-i18n-example
[`push`]: /push
[Runtime Language Switching in Elm]: https://paulfioravanti.com/blog/runtime-language-switching-in-elm/
[speakerdeck]: https://speakerdeck.com/paulfioravanti/runtime-i18n-in-elm
[Tachyons]: http://tachyons.io/
