with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
generic
   type Item is (<>);
   type Index is (<>);
package Conveyer_System is
   type Conveyor (Max: Index) is limited private;

   procedure Move_Robot( C: in out Conveyor; E: in Index );
   procedure Put( C: in out Conveyor; E: in Item );
   procedure Show( C: in out Conveyor );
   function Get(C: Conveyor ) return Item;

private
   type TArray is array( Index range <> ) of Item;
   type Conveyor(Max: Index) is record
      Items: TArray(Index'First..Max) := (others => Item'First );
      Robot_Position: Index := Index'First;
   end record;
   --Extend in the Conveyer_System generic package with a Command enumeration type,
   --with the following values: Move_Left, Move_Right, Put, Get.
   --Define an Algorithm type which is an array containing Command elements.
   --Write a Run procedure which receives an algorithm and a number of iterations, and it
   --executes the algorithm as many times as is in iterations.
   -- Write a Run procedure which receives an algorithm and a number of iterations,
   --and it executes the algorithm as many times as is in iterations.

end Conveyer_System;
