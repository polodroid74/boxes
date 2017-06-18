with Ada.Text_Io;
use Ada.Text_Io;


package Recup_Donnees is
   procedure Recup(T,Q,L,W,H,B: in out Float ; F: out File_Type; C: out Boolean); --C permet de vérifier que l'utilisateur rentre bien un nom de fichier.
end Recup_Donnees;
