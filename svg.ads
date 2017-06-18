with Ada.Text_Io;
use Ada.Text_Io;

package Svg is
   procedure Svg_Line(X1, Y1, X2, Y2 : Float; F:File_type);
   --trace une ligne en svg.
end Svg;
