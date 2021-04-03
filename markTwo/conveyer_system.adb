package body Conveyer_System is

procedure Move_Robot( C: in out Conveyor; E: in Index ) is
begin
   C.Robot_Position := E;
end Move_Robot;

procedure Put( C: in out Conveyor; E: in Item ) is
begin
   C.Items(C.Robot_Position) := E;
end Put;

procedure Show( C: in out Conveyor) is
begin
   for I in C.Items'Range loop
         Put_Line(Item'Image(C.Items(I) ));
      end loop;

end Show;

function Get(C: Conveyor ) return Item is
begin
   return C.Items(C.Robot_Position);
end Get;end Conveyer_System;
