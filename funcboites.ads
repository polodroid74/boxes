with Ada.Text_Io;
use Ada.Text_Io;

package Funcboites is

   procedure Trace_Creneau(Q, T: in Float ; N, Front, Pic: in Natural;F:File_type);

   --Trace un créneau de N queues de longueur Q et d'épaisseur T.
   -- C et P déterminent la forme du créneau.

   procedure Nb_Encoches_Queues(T, Q, W, L: in float);

   --Necessite l-2t >=q et w-2t >=q.
   --Garantit calcul correct du nombre de queues à placer sur le côté de longueur L et sur celui de longueur W.

   procedure Trace_Fond(Q, T, L, W: in Float;F:File_type);

   --Necessite l-2t >=q et w-2t >=q.
   --Garantit tracé correct du fond de la boite de dimension L*W avec des queues de longueur Q et d'épaisseur T

   procedure Trace_Cote(Q, T, H, L: in Float ; Cote: in Natural;F:File_type);

   --Necessite L-2t >=q et H-2t >=q.
   --Garantit un tracé correct du grand coté de la boite de dimension L*H avec des queues de longueur Q et d'épaisseur T

   procedure Trace_Boite(Q, T, L, W, H: in Float;F:File_type);

   --Necessite l-4t >=q, h-2t >=q et w-4t >=q.
   --Garantit un tracé de la demi-boite de hauteur H, de base L*W avec des queues de longueur Q et d'épaisseur T.

end Funcboites;
