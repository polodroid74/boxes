with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;
with Svg;
use Svg;
with Ada.Numerics.Elementary_Functions;  --Réutilisation du code du TP LOGO.
use Ada.Numerics.Elementary_Functions;

package body dessin is
   Pi:Float:=Ada.Numerics.pi;
   X:Float;
   Y:Float;
   X1:Float;
   Y1:Float;
   C:Integer;
   Angle: Float;


   procedure Initialisation(L,W,H : in Float; F: File_type) is  --On adapte le format aux dimensions de la boîte.
   begin
      Put(F,"<svg width=""");
      Put(F,Float'Image(Float'Max(L,W)*17.0));
      Put(F,""" height=""");
      Put(F,Float'Image(2.0*Float'Max(H,W)));
      Put_line(F,""">");
      X:=L/2.0;
      Y:=H/2.0;
      X1:=0.0;
      Y1:=0.0;
      Angle:=0.0;
   end;


   procedure AV(Distance : Float; F:File_type) is
   begin

      X1:= Sin(Angle*(pi/180.0))*Distance+X;
      Y1:= Cos(Angle*(pi/180.0))*Distance+Y;

      if C=1 then
         Svg_Line(X,Y,X1,Y1,F);
      end if;

      X:=X1;
      Y:=Y1;

   end;

   procedure TD(Angle_Degre : Float) is
   begin
      Angle:= Angle - Angle_Degre;
   end;

   procedure TG(Angle_Degre : Float) is
   begin
      Angle:=Angle+Angle_Degre;
   end;

   procedure LC is
   begin
      C:=0;
   end;

   procedure BC is
   begin
      C:=1;
   end;

   procedure Fin(F: File_Type) is
   begin
      Put(F,"</svg>");
   end;

end dessin;
