import "tachyons"
import { Elm } from "./Main.elm"

const app =
  Elm.Main.init({
    flags: { language: getLanguage() }
  })

app.ports.outbound.subscribe(language => {
  localStorage.setItem("elm-i18n-example-language", language)
})

function getLanguage() {
  return localStorage.getItem("elm-i18n-example-language") ||
    navigator.language ||
    navigator.userLanguage
}
