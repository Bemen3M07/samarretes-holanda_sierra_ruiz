Feature: Calculadora de samarretes

Scenario: Calcular el preu sense descompte
  Given l'usuari introdueix 10 samarretes
  And selecciona la talla "petita"
  When l'usuari no selecciona cap descompte
  Then el preu total hauria de ser 79.0 €

Feature: Calculadora de samarretes

Scenario: Calcular el preu sense descompte
  Given l'usuari introdueix 10 samarretes
  And selecciona la talla "petita"
  When l'usuari no selecciona cap descompte
  Then el preu total hauria de ser 79.0 €

Feature: Calculadora de samarretes

Scenario: Calcular el preu amb descompte de 20€ per comandes més grans de 100€
  Given l'usuari introdueix 15 samarretes
  And selecciona la talla "gran"
  When l'usuari selecciona el descompte "20€"
  Then el preu total hauria de ser 170.5 €

Feature: Calculadora de samarretes

Scenario: Descompte de 20€ no aplicat perquè la compra és inferior a 100€
  Given l'usuari introdueix 5 samarretes
  And selecciona la talla "petita"
  When l'usuari selecciona el descompte "20€"
  Then el preu total hauria de ser 39.5 €

Feature: Calculadora de samarretes

Scenario: Càlcul amb 0 samarretes
  Given l'usuari introdueix 0 samarretes
  When l'usuari selecciona la talla "mitjana"
  And no selecciona cap descompte
  Then el preu total hauria de ser 0.0 €

Feature: Calculadora de samarretes

Scenario: Càlcul amb informació incompleta
  Given l'usuari no introdueix cap nombre de samarretes
  And no selecciona cap talla
  When l'usuari intenta calcular el preu
  Then el preu hauria de ser 0.0 €
