# Elm I18n Example

An example implementation of runtime language switching using [Elm][].

It re-implements [Tachyons][]'
[Full Screen Centered Title component documentation page][] in Elm, adds a
language dropdown menu, and allows you to switch the language of the message
displayed.

It was created as part of a blog post I wrote about
[Runtime Language Switching in Elm][]. The post references the example when it
was using Elm 0.18, so that application state is preserved in the
[0.18 branch][].

[Demo][]

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

## Presentation

I did a talk about this project at the [Elm Sydney Meetup][] on
[21 June 2018][elm-sydney-20180621] ([slide deck][speakerdeck]).

[0.18 branch]: https://github.com/paulfioravanti/elm-i18n-example/tree/0.18
[Demo]: https://elm-i18n-example.herokuapp.com/
[Elm]: http://elm-lang.org/
[Elm Sydney Meetup]: https://www.meetup.com/Sydney-Elm-Meetup/
[elm-sydney-20180621]: https://www.meetup.com/Sydney-Elm-Meetup/events/pdpzvmyxjbcc/
[Full Screen Centered Title component documentation page]: http://tachyons.io/components/layout/full-screen-centered-title/index.html
[Runtime Language Switching in Elm]: https://paulfioravanti.com/blog/2018/05/11/runtime-language-switching-in-elm/
[speakerdeck]: https://speakerdeck.com/paulfioravanti/runtime-i18n-in-elm
[Tachyons]: http://tachyons.io/
