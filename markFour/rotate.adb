procedure Rotate(E: in out Item_Array) is
   temp : Item;
begin
   if toRight = True then ----rotate to right
      temp := E( E'Last );
      for i in reverse Index'Succ(E'First)..E'Last loop
         E(i) := E( Index'Pred(i) );
         E(E'First) := temp;
      end loop;
   else --rotate to left
      temp := E( E'First );
      for i in E'First..Index'Pred(E'Last) loop
         E(i) := E( Index'Succ(i) );
         E(E'Last) := temp;
      end loop;
   end if;

end Rotate;
