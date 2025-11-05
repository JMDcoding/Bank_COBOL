       IDENTIFICATION DIVISION.
       PROGRAM-ID. JeanMarcBank.
       AUTHOR. AnonDev.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FICHIER-COMPTES ASSIGN TO "data/comptes.dat"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  FICHIER-COMPTES.
       01  ENREGISTREMENT-COMPTE.
           05  NUMERO-COMPTE     PIC 9(5).
           05  NOM-CLIENT        PIC A(20).
           05  SOLDE             PIC 9(7)V99.

       WORKING-STORAGE SECTION.
       01  CHOIX                PIC 9 VALUE 0.

       PROCEDURE DIVISION.
       DEBUT.
           DISPLAY "====================================".
           DISPLAY "        SYSTEME BANCAIRE COBOL      ".
           DISPLAY "====================================".
           PERFORM MENU-PRINCIPAL
           STOP RUN.

       MENU-PRINCIPAL.
           PERFORM UNTIL CHOIX = 5
               DISPLAY " "
               DISPLAY "******** MENU PRINCIPAL ********"
               DISPLAY "1. Creer un compte"
               DISPLAY "2. Effectuer un depot"
               DISPLAY "3. Effectuer un retrait"
               DISPLAY "4. Consulter un solde"
               DISPLAY "5. Quitter"
               DISPLAY "Votre choix : " WITH NO ADVANCING
               ACCEPT CHOIX
               EVALUATE CHOIX
                   WHEN 1
                       CALL "creation"
                   WHEN 2
                       CALL "depot"
                   WHEN 3
                       CALL "retrait"
                   WHEN 4
                       CALL "consultation"
                   WHEN 5
                       DISPLAY "Merci d'avoir utilise JeanMarcBank."
                   WHEN OTHER
                       DISPLAY "Choix invalide, reessayez."
               END-EVALUATE
           END-PERFORM.
