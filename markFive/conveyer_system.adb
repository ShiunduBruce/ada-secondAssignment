package body Conveyer_System is

   procedure Move_Robot( C: in out Conveyor; E: in Index ) is
   begin
      C.Robot_Position := E;
end Move_Robot;

procedure Put( C: in out Conveyor; E: in Item ) is
   begin
      --temporary solution as we do not want to put something to keep holding of first position
      --if C.Robot_Position = C.Items'First then
       --  C.Robot_Position := C.Items'Last;
      --end if;

   C.Items(C.Robot_Position) := E;
end Put;

   procedure Show( C: in out Conveyor) is
      first : Item := C.Items(C.Items'First);
   begin
      for I in C.Items'Range loop
         if C.Items(I) = first then
            Put_Nothing;
         else
            Put_Line(Item'Image(C.Items(I) ));
         end if;

      end loop;
   end Show;

   procedure Move (C: in out Conveyor) is
      procedure conveyor_rotate is new Rotate(Item, Index, TArray );
   begin
      conveyor_rotate(C.Items);
   end Move;

function Get(C: Conveyor ) return Item is
begin
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
               when Put    => 	Random_Item.Reset(G); Put(C, Random_Item.Random(G));
               when Get    => Put(C, C.Items(C.Items'First)); --We remove it by puttiing nothing

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
