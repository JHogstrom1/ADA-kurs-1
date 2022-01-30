with Ada.Text_IO;             use Ada.Text_Io;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_Io;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;

procedure Moms is
   
   First, Last, Steps, Procent : Float;
   AntalVarv : Integer;
   
   
begin   
   loop
      Put("Första pris: ");
      Get(First);
      exit when (First > 0.0);
      Put_Line("Felaktigt värde!");
      
   end loop;
   
   
   loop
      Put("Sista pris: ");
      Get(Last);
      exit when (Last > 0.0 and Last - First >= 0.0);
      Put_Line("Felaktigt värde!");
      
   end loop;
   
   
   loop
      Put("Steg: ");
      Get(Steps);
      exit when (Steps > 0.0);
      Put_Line("Felaktigt värde!");
      
   end loop;
   
   
   loop
      Put("Momsprocent: ");
      Get(Procent);
      exit when (Procent >= 0.0 and Procent <= 100.0);
      Put_Line("Felaktigt värde!");
      
   end loop;
   
   
   AntalVarv := Integer(Float'Floor((Last-First)/Steps));
   Procent := Procent/100.0;
   
   New_Line;
   Put_Line("============ Momstabell ============");
   Put_Line("Pris utan moms  Moms   Pris med moms");
   
   for X in 0..AntalVarv loop  
      Put(First, Fore => 6, Aft => 2, Exp => 0);
      Put(First*Procent, Fore => 8, Aft => 2, Exp => 0);
      Put(First+(First*Procent), Fore => 9, Aft => 2, Exp => 0);
      First := First + Steps;
      New_Line;
      
   end loop;
  
end Moms;
