# this file imports all datasources needed



# 1. participants data ----------------------------------------------------

sample_data <- read_csv("data/sample_data.csv", col_types = cols())





# 2. other data sources ---------------------------------------------------

# here you would import text data from a spreadsheet

# this is sample text
sample_textanswers <- 
  tribble(~Item, ~language, ~text,
          "V1", "DE", "Die Abteilungsleitung unterstützt das Pflege- / Betreuungspersonal.",
          "V1", "FR", "Le/la responsable de l'unité / étage / service  soutient l'équipe soignante (s'il n'y a qu'une unité, le/la responsable est l'infirmier-ère chef-fe).",
          "V2", "DE", "Die Vorgesetzten nutzen Fehler in der Pflege und Betreuung zum gemeinsamen Lernen und nicht zum Kritisieren.",
          "V2", "FR", "Le/la responsable de l'unité / étage / service  soutient l'équipe soignante (s'il n'y a qu'une unité, le/la responsable est l'infirmier-ère chef-fe).",
          "V3", "DE", "Die Abteilungsleitung ist eine kompetente Führungsperson.", 
          "V3", "FR", "Le/la responsable de l'unité est un(e) dirigeant(e) compétent(e).", 
          "V4", "DE", "Die Abteilungsleitung steht beim Treffen von Entscheidungen hinter dem Pflege- / Betreuungspersonal, auch wenn diese im Konflikt mit anderen Berufsgruppen stehen.",
          "V4", "FR", "Le/la responsable de l'unité soutient son personnel dans ses prises de décision, même s’il y a un conflit avec les autres professions de la santé.")
