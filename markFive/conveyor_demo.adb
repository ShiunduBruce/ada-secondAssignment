with Conveyer_System, Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;

procedure conveyor_demo is
   type Toys is (Nothing, Car, Doll, Ball);

   procedure PutStir is
   begin
      Put(" * ");
   end PutStir;

   package conv is new Conveyer_System(Toys, Positive, PutStir);
   use conv;
   C: Conveyor(15);
   AA : Algorithm := (Put, Move_Right, Move_Right, Put);
   AB : Algorithm := (Get, Move_Left, Move_Left, Get);
   AC : Algorithm := (Put, Move_Left);
   AD : Algorithm := (Get, Move_Right);
begin

Run (C, AA, 1);
Show (C); New_Line;
Run (C, AB, 1);
Show (C);New_Line;
Run (C, AC, 5);
Show (C);New_Line;
Run (C, AD, 2);
Show (C);New_Line;

end conveyor_demo;
