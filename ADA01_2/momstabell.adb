with Ada.Text_IO;             use Ada.Text_Io;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_Io;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;

procedure Moms is
   
   First, Last, Steps, Procent : Float;
   AntalVarv : Integer;
   
   
begin
   
   Put("Första pris: ");
   Get(First);
 
   while Integer(Float'Floor(First)) < 0 loop
     Put("Felaktigt värde!");
     New_Line;
     Put("Första pris: ");
     Get(First);
	
  end loop;
   
   
   Put("Sista pris: ");
   Get(Last);
   
   while Integer(Float'Floor(Last)) - Integer(Float'Floor(First)) < 0 loop
      Put("Felaktigt värde!");
      New_Line;
      Put("Sista pris: ");
      Get(Last);
	 
   end loop;
   
   Put("Steg: ");
   Get(Steps);
   
   while Integer(Float'Floor(Steps)) < 0 or Steps = 0.0  loop
      Put("Felaktigt värde!");
      New_Line;
      Put("Steg: ");
      Get(Steps);
   end loop;
     
   Put("Momsprocent: ");
   Get(Procent);
   
   while Integer(Float'Floor(Procent)) < 0 or Procent > 100.0  loop	
      Put("Felaktigt värde!");
      New_Line;
      Put("Momsprocent: ");
      Get(Procent);
   end loop;
   
   
   AntalVarv := Integer(Float'Floor((Last-First)/Steps));
   Procent := Procent/100.0;
   
   New_Line;
   Put_Line("============ Momstabell ============");
   Put_Line("Pris utan moms  Moms   Pris med moms");
   
   while AntalVarv >= 0 loop  
      Put(First, Fore => 6, Aft => 2, Exp => 0);
      Put(First*Procent, Fore => 8, Aft => 2, Exp => 0);
      Put(First+(First*Procent), Fore => 9, Aft => 2, Exp => 0);
      First := First + Steps;
      AntalVarv := AntalVarv - 1;
      New_Line;
      
   end loop;
  
end Moms;
