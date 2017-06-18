with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;

package body Svg is  --On ne conserve que la fonction Svg_line.


   procedure Svg_Line(X1, Y1, X2, Y2 : Float; F:File_type) is
   begin
      Put(F,"<line x1=""");
      Put(F,X1);
      Put(F,""" y1=""");
      Put(F,Y1);
      Put(F,""" x2=""");
      Put(F,X2);
      Put(F,""" y2=""");
      Put(F,Y2);
      Put_Line(F,""" style=""stroke:rgb(255,0,0);stroke-width:0.1""/>");
   end Svg_Line;

end Svg;
