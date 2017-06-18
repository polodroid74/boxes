with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO,Ada.Command_line;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO,Ada.Command_line;
with Funcboites,Dessin,Recup_donnees;
use Funcboites,Dessin,Recup_donnees;

procedure boites is
   Q,L,W,T,H,B: Float := 0.0;
   F: File_Type;
   C: Boolean := False;
   Erreur: exception;

begin

   Recup(T,Q,L,W,H,B,F,C);

   if (not C) or T=0.0 or Q=0.0 or L=0.0 or W=0.0 or H=0.0 or B=0.0 then --Erreur si une des données est nulle on non rentrée par l'utilisateur ou si le nom du fichier est incorrect.

      raise Erreur;

   elsif (B >= H-2.0*T) or (Q>L-4.0*T) or (Q>W-4.0*T) or (Q> B-2.0*T) or (Q> (H/2.0)-2.0*T)  then --Erreur si on ne peut pas tracer au moins un créneau sur un côté.
      raise Erreur;
   else



      Initialisation(L,W,H,F);
      TG(90.0);
      Trace_Boite(Q,T,L,W,H/2.0,F);  --Tracé des trois boîtes.
      Trace_Boite(Q,T,L,W,H/2.0,F);
      Trace_Boite(Q,T,L-2.0*T,W-2.0*T,B,F);
      Fin(F);
   end if;

exception

   when Erreur =>
      Put("Saisie incorrecte, merci saisir une boîte conforme.");  -- Erreur rattrapée.

end boites;

