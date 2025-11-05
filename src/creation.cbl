       IDENTIFICATION DIVISION.
       PROGRAM-ID. creation.

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
       01  WS-NUMERO     PIC 9(5).
       01  WS-NOM        PIC A(20).
       01  WS-SOLDE      PIC 9(7)V99 VALUE 0.

       PROCEDURE DIVISION.
       DEBUT.
           DISPLAY "=== CREATION D'UN COMPTE BANCAIRE ==="
           DISPLAY "Entrez le numero du compte : " WITH NO ADVANCING
           ACCEPT WS-NUMERO
           DISPLAY "Entrez le nom du client : " WITH NO ADVANCING
           ACCEPT WS-NOM
           MOVE WS-NUMERO TO NUMERO-COMPTE
           MOVE WS-NOM TO NOM-CLIENT
           MOVE WS-SOLDE TO SOLDE
           OPEN EXTEND FICHIER-COMPTES
           WRITE ENREGISTREMENT-COMPTE
           CLOSE FICHIER-COMPTES
           DISPLAY "Compte cree avec succes."
           STOP RUN.
       END PROGRAM creation.
