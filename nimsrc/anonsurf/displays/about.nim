import gintro / [gtk, gdkpixbuf]
import system
import .. / cores / status


proc onClickAbout*(b: Button) =
  #[
    Show help for main and credit in new dialog
  ]#
  const readImgLogo = staticRead("../../../icons/anon-about.svg")
  let
    showAbout = newAboutDialog()
    bufLoader = newPixbufLoader()
  
  discard bufLoader.write(readImgLogo)
  discard bufLoader.close()
  let imgLogo: Pixbuf = bufLoader.getPixbuf()
  showAbout.setLogo(imgLogo)
  showAbout.setProgramName("AnonSurf")
  showAbout.setVersion(surfVersion)
  showAbout.setArtists([
    "Federica \"marafed\" Marasà",
    # "Manuel \"Serverket\" Hernandez",
    "David \"mcder3\" Linares",
  ]) # Artwork by
  # showAbout.setDocumenters([]) # Documented by
  # showAbout.setTranslatorCredits([]) # Translated by
  showAbout.setAuthors([
    "Lorenzo \"Palinuro\" Faletra",
    "Nong Hoang \"DmKnght\" Tu",
    "Lisetta \"Sheireen\" Ferrero",
    "Francesco \"Mibofra\" Bonanno",
    "Manuel \"Serverket\" Hernandez",
  ])
  showAbout.setComments("Anonymous Toolkit for Parrot OS")
  showAbout.setCopyright(
    "Copyright © 2013 - 2020 Lorenzo \"Palinuro\" Faletra\nCopyright © 2020 Parrot Security CIC"
  )
  showAbout.setLicenseType(gpl_3_0)
  showAbout.setWebsite("https://nest.parrot.sh/packages/tools/anonsurf")
  showAbout.setWebsiteLabel("Gitlab Source")

  discard showAbout.run()
  showAbout.destroy()
