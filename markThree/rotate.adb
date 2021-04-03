procedure Rotate(E: in out Item_Array) is
   temp : Item := E( E'First );
begin
   for i in E'First..Index'Pred(E'Last) loop
      E(i) := E( Index'Succ(i) );
   end loop;
   E(E'Last) := temp;
end Rotate;
