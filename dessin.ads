with Ada.Text_Io;
use Ada.Text_Io;

package dessin is
   --initialise les donnees internes, affiche l'en tete du fichier svg.
   procedure Initialisation(L,W,H : in Float;F:File_type);
   --avance (dessine une ligne si le crayon est baisse).
   procedure AV(Distance : Float;F:File_type);
   --tourne a droite (n'affiche rien en soi).
   procedure TD(Angle_Degre : Float);
   --tourne a gauche (n'affiche rien en soi).
   procedure TG(Angle_Degre : Float);
   --leve le crayon : a partir de maintenant "avance" n'affiche plus rien.
   procedure LC;
   --baisse le crayon : a partir de maintenant "avance" affiche une ligne.
   procedure BC;
   --affiche la fin du fichier svg.
   procedure Fin(F:File_Type);
end dessin;
