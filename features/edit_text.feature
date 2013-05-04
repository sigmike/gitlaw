Feature: Edit a text
  In order to suggest a new text
  As a citizen
  I want write a modified text

  Scenario: First edit
    Given there's a user "France"
    And there's a text "Constitution française" with the content of "db/french_constitution.txt"
    And the text "Constitution française" is owned by user "France"
    And the text "Constitution française" is featured

    When I go to the home page
    And I click on "Constitution française"
    Then I should see "Le peuple français proclame solennellement son attachement aux Droits de l'Homme"

    When I click on "Proposer une modification"
    Then I should see "Vous devez être connecté"

    When I click on "Créer un compte"
    And I fill the sign up form with name "Bobby", email "bob@example.com" and password "password"
    Then I should see "Création d'une modification"

    When I fill "Titre de la modification" with "Pas de cérémonie"
    And I fill "Motivation" with "Nous ne sommes pas solennels."
    And I replace "proclame solennellement son attachement" with "proclame son attachement" in "Texte modifié"
    And I click on "Enregistrer"
    Then I should see "Constitution française / Pas de cérémonie"
    And I should see "Le peuple français proclame solennellement son attachement aux Droits de l'Homme"
    And I should see "Le peuple français proclame son attachement aux Droits de l'Homme"
    And the word "solennellement" should be highlighted
    And the current path should be "/constitution-francaise/pas-de-ceremonie"
