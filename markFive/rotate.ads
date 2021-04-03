with Ada.Text_IO; use Ada.Text_IO;
generic
   type Item is private;
   type Index is (<>);
   type Item_Array is array(Index range <> ) of Item;

procedure Rotate(E: in out Item_Array);
