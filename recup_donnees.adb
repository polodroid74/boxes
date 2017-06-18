with Ada.Text_Io, Ada.Integer_Text_Io, Ada.Command_Line;
use Ada.Text_Io, Ada.Integer_Text_Io, Ada.Command_Line;

package body Recup_Donnees is

   procedure Recup(T,Q,L,W,H,B: in out Float; F: out File_Type; C: out Boolean) is

   begin
      C:=False;  --Evite avertissement à la compilation lors de la compilation du test "C/=True".
      for I in 1..Argument_Count/2 loop

         if Argument(2*I - 1) = "-t" then
            declare
               T0 : String := Argument(2*I);
            begin
               T := Float'Value(T0);
            end;
         elsif Argument(2*I - 1) = "-q" then
            declare
               Q0 : String := Argument(2*I);
            begin
               Q := Float'Value(Q0);
            end;
         elsif Argument(2*I - 1) = "-l" then
            declare
               L0 : String := Argument(2*I);   --Dès que l'on détecte un argument, on connait la taille du nombre et on peut donc déclarer une string.
            begin
               L := Float'Value(L0);
            end;
         elsif Argument(2*I - 1) = "-w" then
            declare
               W0 : String := Argument(2*I);
            begin
               W := Float'Value(W0);           --Si la chaîne de caractère ne contient pas un nombre, un erreur sera levée.
            end;
         elsif Argument(2*I - 1) = "-h" then
            declare
               H0 : String := Argument(2*I);
            begin
               H := Float'Value(H0);
            end;
         elsif Argument(2*I - 1) = "-b" then
            declare
               B0 : String := Argument(2*I);
            begin
               B := Float'Value(B0);
            end;
         elsif Argument(2*I - 1) = "-f" and C/=True then --teste si on a déja créé un fichier

            declare
               F0 : String := Argument(2*I);
            begin

               if F0(F0'Last-3..F0'Last)=".svg" then  --teste si le format du fichier est bien le bon. Sinon on lève une erreur dans boites.adb

                  Create(F,Out_File,Argument(2*I));
                  C:= True;

               end if;

            end;

         end if;

      end loop;
   end Recup;


end Recup_donnees;
