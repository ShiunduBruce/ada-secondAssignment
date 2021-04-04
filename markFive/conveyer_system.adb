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
      first : Item := Item'First;
   begin
      New_Line;
      Put_Line("The items are :");
         for I in C.Items'Range loop
            if C.Items(I) = first then
               Put_Nothing;
            else
               Put(Item'Image(C.Items(I) ) & " ");
         end if;
      end loop;
      New_Line;
      Put_Line("Robot's position is :" & Index'Image(C.Robot_Position));
   end Show;

   procedure Move (C: in out Conveyor) is
      procedure conveyor_rotate is new Rotate(Item, Index, TArray );
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

   procedure Run(C: in out Conveyor; A : in Algorithm; n : in Natural) is
      package Random_Item is new Ada.Numerics.Discrete_Random(Item);
      G: Random_Item.Generator;
   begin
      for i in 1..n loop
         for j in A'Range loop
            case A(j) is
               when Move_Left   =>
                  if C.Robot_Position = Index'First then
                     Move_Robot(C, C.Items'Last);
                  else
                     Move_Robot(C, Index'Pred(C.Robot_Position));
                  end if;

               when Move_Right  =>
                  if C.Robot_Position = Index'Last then
                     Move_Robot(C, C.Items'First);
                   else
                     Move_Robot(C, Index'Succ(C.Robot_Position));
                  end if;
               when Put    =>
                  Random_Item.Reset(G);
                  if C.Items( C.Robot_Position ) = Item'First then --We put when it is empty
                     Put(C, Random_Item.Random(G));
                  end if;
               when Get    =>
                     New_Line;
                     Put("Item gotten :" & Item'Image(C.Items(C.Robot_Position) ));
                     C.Items(C.Robot_Position) := Item'First; --We remove it by puttiing nothing
               when others => null;
            end case;
         end loop;
      end loop;

   end Run;
--Generate an item that is not the first one
   --function generateItem(C: Conveyor) return Item is
     -- package Random_Item is new Ada.Numerics.Discrete_Random(Item);
      --G: Random_Item.Generator;
      --it : Item := Random_Item.Random(G);
   --begin
     -- while it /= C.Items(C.Items'First) loop
       --  Random_Item.Reset(G);
        -- it := Random_Item.Random(G);
     -- end loop;

      ---return it;

  -- end generateItem;
end Conveyer_System;
