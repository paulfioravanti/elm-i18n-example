import "tachyons"
import { Main } from "./Main.elm"

const appContainer = document.getElementById("root")

if (appContainer) {
  const app = Main.embed(appContainer, { language: getLanguage() })

  app.ports.storeLanguageInLocalStorage.subscribe((language) => {
    localStorage.setItem("elm-i18n-example-language", language)
  })
}

function getLanguage() {
  return localStorage.getItem("elm-i18n-example-language") ||
    navigator.language ||
    navigator.userLanguage
}
