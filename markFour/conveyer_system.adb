package body Conveyer_System is

procedure Move_Robot( C: in out Conveyor; E: in Index ) is
begin
   C.Robot_Position := E;
end Move_Robot;

procedure Put( C: in out Conveyor; E: in Item ) is
   begin
      if C.Items(C.Robot_Position) /= Item'First then
        raise Slot_Not_Empty;
      end if;
      C.Items(C.Robot_Position) := E;
end Put;

   procedure Show( C: in out Conveyor) is
   begin
      Put_Line("The items are :");
      for I in C.Items'Range loop
         Put(Item'Image(C.Items(I) ) & " ");
      end loop;
      New_Line;
      Put_Line("Robot's position is :" & Index'Image(C.Robot_Position));
   end Show;

   procedure Move (C: in out Conveyor;  d: Direction) is
      isRight : Boolean := ( d = RIGHT ); --we rotate based on position of robot
      procedure conveyor_rotate is new Rotate(Item, Index, TArray, isRight );
   begin
      conveyor_rotate(C.Items);
   end Move;

function Get(C: Conveyor ) return Item is
   begin
      if C.Items(C.Robot_Position) = Item'First then
         raise Slot_Is_Empty;
      end if;

      return C.Items(C.Robot_Position);
   end Get;



end Conveyer_System;
