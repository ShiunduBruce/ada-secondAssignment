with Conveyer_System, Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;

procedure conveyor_demo is
   type Toys is (Nothing, Car, Doll, Ball);
   package conv is new Conveyer_System(Toys, Positive);
   use conv;
   B: Conveyor(8);

begin
Move_Robot(B,1);
Put(B, Nothing);
Move_Robot(B,2);
Put(B, Car);
Move_Robot(B,3);
Put(B,Doll);
   Move_Robot(B,3);
  -- Put(B,Ball); --raise a slot_not_empty
   Move_Robot(B,7);
   --Put_Line(Toys'Image(Get(B))); --raise a slot_is_empty
show(B);
Move(B, RIGHT);
New_Line;
show(B);
New_Line;
Move(B, LEFT);
New_Line;
   show(B);



end conveyor_demo;
