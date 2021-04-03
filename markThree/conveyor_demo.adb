with Conveyer_System, Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;

procedure conveyor_demo is
type Toys is (Nothing, Car, Doll, Ball);
package conv is new Conveyer_System(Toys, Positive);
B: conv.Conveyor(8);

begin
conv.Move_Robot(B,1);
conv.Put(B, Nothing);
conv.Move_Robot(B,2);
conv.Put(B, Car);
conv.Move_Robot(B,4);
conv.Put(B,Doll);
conv.Move_Robot(B,3);
conv.Put(B,Ball);
   conv.show(B);
   conv.Move(B);
   New_Line;
   conv.show(B);

end conveyor_demo;
