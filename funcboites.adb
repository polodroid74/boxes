with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;
with Dessin;
use Dessin;--On réutilise les procedures de tracé du TP LOGO (Nous en avons demandé lautoisaion).


package body Funcboites is

   Nl:Natural:=0; --Nombre d'encoches et de queues sur la largeur et la longeur.
   Nw:Natural:=0;
   Pl:float:=0.0; --Variable indiquant si on a retiré une encoche pour avoir un nombre impair d'encoche et de queues.
   Pw:float:=0.0;
   Rl:natural:=0; --Reste division Euclidienne de L-2*T (ou W-2*T) par Q.
   Rw:natural:=0;




   procedure Nb_Encoches_Queues(T,Q,W,L:in float) is

      --Necessite l-2t >=q et w-2t >=q.
      --Garantit Nl et Nw (nombre d'encoches et queue sur la largeur et la longeur) corrects.

      Q0:Natural:=Integer(Q);
      L0:Natural:=Integer(L);-- Afin d'effectuer des divisions euclidiennes, on transforme les nombres floatants en nombres entiers.
      T0:Natural:=Integer(T);
      W0:Natural:=Integer(W);
   begin
      Pl:=0.0;
      Pw:=0.0;
      Nl:=(L0-2*T0)/Q0;  --Divisions euclidiennes.
      Nw:=(W0-2*T0)/Q0;
      Rl:=(L0-2*T0) mod(Q0);  --On mémorise le reste afin de ne pas l'oublier losque l'on trace les cotés.
      Rw:=(W0-2*T0) mod(Q0);

      if Nl mod 2 = 0 then
         Nl:=Nl-1;
         Pl:=1.0;  --On a retiré une encoche (ou une queue): On passe Pl (ou Pw) à 1.
      end if;

      if Nw mod 2 = 0 then
         Nw:=Nw-1;
         Pw:=1.0;
      end if;

   end Nb_Encoches_Queues;

   procedure Trace_Creneau (Q,T: in Float; N,Front,Pic: in Natural; F: File_type) is
      Angle:Float:=90.0;
   begin
      BC;  --Important, sinon on ne trace rien.
      if Front =0 then
         TD(90.0);
         AV(T,F);
         TG(90.0);
      elsif Front =2 then   --La variable Front permet de savoir si le créneau commence par un front montant (Front=2),...
         TG(90.0);          --... un front descendant (Front=0) ou un plat (Front=1).
         Av(T,F);
         TD(90.0);
      end if;
      if Pic = 1 then  --la variabl Pic permet de connaitre la nature du deuxième créneau (Front montant, front descendant ou plat).
         Angle:=-Angle;
      end if;
      for I in 1..N loop
         AV(Q,F);
         TD(Angle);

         if I /= N or Front /=1 then
            AV(T,F);  --Evite de redescendre de "t" à la fin d'un créneau plat.
         end if;

         TG(Angle);
         Angle:=-Angle;

      end loop;

   end Trace_Creneau;




   procedure Trace_Fond (Q,T,L,W :in Float; F:File_type) is  --Ici, pour avoir un tracé exact, on effectue nos calculs (surtout les divisions) avec des flottants.

      --Necessite l-2t >=q et w-2t >=q.
      --Garantit Un tracé correct du fond.

      Rl0:Float;
      Rw0:Float;

   begin
      Nb_Encoches_Queues(T,Q,W,L);
      Rl0:=Float(Rl);
      Rw0:=Float(Rw);

      for I in 1..2 loop

         BC;
         AV(T+(Rl0/2.0)+Pl*(Q/2.0),F); --Si Pl est à 0, on ne rajoute pas Q/2 de chaque coté( on a pas retiré un creneau).
         Trace_Creneau(Q,T,Nl,0,1,F);
         AV(T+(Rl0/2.0)+Pl*(Q/2.0),F);
         TD(90.0);
         AV(T+(Rw0/2.0)+Pw*(Q/2.0),F);
         Trace_Creneau(Q,T,Nw,1,0,F);
         AV(T+(Rw0/2.0)+Pw*(Q/2.0),F);
         TD(90.0);
      end loop;

      LC; --important pour ne pas tracer de trait entre les pièces.

   end Trace_Fond;



   procedure Trace_Cote(Q,T,H,L: in Float; Cote: in Natural ; F: File_type) is   -- Cette fonction permet de tracer les coté s'emboitant sur la largeur et la longeur du fond.

      --Necessite l-2t >=q et w-2t >=q.
      --Garantit Un tracé correct du coté.

      Rl0:Float;
      Rw0:Float;

   begin
      BC;
      Nb_Encoches_Queues(T,Q,H,L);
      Rl0:=Float(Rl);
      Rw0:=Float(Rw); --On remet à jour les variles calculées par Nb_encoches_queues.
      AV(T*Float(Cote)+(Rl0/2.0)+Pl*(Q/2.0),F);
      Trace_Creneau(Q,T,Nl,2-cote,0+Cote,F);  --La variable coté sert à inddiquer si on trace un coté "largeur" ou un coté "longeur".
      AV(Float(cote)*T+(Rl0/2.0)+Pl*(Q/2.0),F); -- On passe cté en float afin d'avoir un calcul correct (divisions).
      TD(90.0);
      AV((Rw0/2.0)+Pw*(Q/2.0),F);
      Trace_Creneau(Q,T,Nw,1,1-Cote,F);
      AV((Rw0/2.0)+Pw*(Q/2.0),F);
      TG(90.0-Float(Cote)*180.0);
      AV(T,F);
      TD(90.0-Float(Cote)*180.0);
      AV(T,F);
      TD(90.0);
      AV(L-2.0*T*Float(Cote),F);
      TD(90.0);
      AV(T,F);
      TD(90.0-Float(Cote)*180.0);
      AV(T,F);
      TG(90.0-Float(Cote)*180.0);
      AV((Rw0/2.0)+Pw*(Q/2.0),F);
      Trace_Creneau(Q,T,Nw,1,1-Cote,F);
      AV((Rw0/2.0)+Pw*(Q/2.0),F);
      LC;
   end Trace_Cote;

   procedure Trace_Boite(Q,T,L,W,H: in Float; F:File_type)is

      --Nessecite l-4t >=q et w-4t >=q.
      --Garantit un tracé de boîte correct.

      D : Float := 2.0*T;  --Distance entre les pièces fixée à 2*T (convention).
   begin
      Trace_Fond(Q,T,L,W,F);
      AV(L+D,F);
      TD(90.0);
      AV(T,F);
      TG(90.0);
      for I in 1..2 loop
         Trace_Cote(Q,T,H,L,0,F); --Tracé des deux cotés s'emboitant sur la longeur du fond.
         TD(90.0);
         AV(L+D,F);
      end loop;
      AV(-T,F);
      for I in 1..2 loop
         Trace_Cote(Q,T,H,W,1,F);  --Tracé des deux cotés s'emboîtant sur la largeur du fond.
         TD(90.0);
         AV(W+D,F);
      end loop;
   end Trace_Boite;

end funcBoites;



