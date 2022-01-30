with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;         use Ada.Float_Text_IO;
with Ada.Numerics;              use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; 
use  Ada.Numerics.Elementary_Functions;


procedure Calculator is
   
-------------------------------------------------------------------------
   
   procedure Menu_Selection (Selection : out Integer) is
      Menu_Choice : Integer;
      
   begin -- HUVUDMENY
      Put_Line("=== HUVUDMENY ===");
      Put_Line("1. Beräkna hypotenusa");
      Put_Line("2. Beräkna triangelvinklar");
      Put_Line("3. Beräkna N-fakultet");
      Put_Line("4. Avsluta programmet");
      loop
	 Put("Val: ");
	 Get(Menu_choice);
	 Selection := Menu_Choice;
	 exit when (Menu_Choice > 0 and Menu_Choice < 5);
	 Put_Line("Felaktigt val!");
      end loop;
      
   end Menu_Selection;
   
-------------------------------------------------------------------------
   
   function Calculate_Hypothenuse (A, B : in Integer) return Float is
      
      Hypothenuse : Float;
      
   begin
      Hypothenuse := Sqrt(Float(A**2) + Float(B**2));
      return Hypothenuse;
      
   end Calculate_Hypothenuse;
   
-------------------------------------------------------------------------
   
   procedure Hypothenuse_Program is
      Katet1, Katet2 : Integer;
      Hypotenusa : Float;
      
   begin
      loop
	 Put("Mata in kateternas längder: ");
	 Get(Katet1);
	 Get(Katet2);
	 exit when (Katet1 > 0 and Katet2 > 0);
	 Put_Line("Felaktigt val!");
      end loop;
      
      Hypotenusa := Calculate_Hypothenuse(Katet1, Katet2);
      
      Put("Hypotenusan är ");
      Put(Hypotenusa, 0, 2, 0);
      New_Line;
      New_Line;
      
   end Hypothenuse_Program;
   
-------------------------------------------------------------------------
   
   procedure Calculate_Angles (Hc, Sa : in Float; 
			       Va, Vb, Vc : out float) is

      
   begin
      Va := 180.0 / Pi * Arcsin(Sa/Hc);
      Vb := 180.0 / Pi * Arccos(Sa/Hc);
      Vc := 180.0 - Va - Vb;
   end Calculate_Angles;

   
   procedure Angle_Program is
      Hc, Sa : Float;
      Va, Vb, Vc : Float;
      
   begin
      
      loop
	 Put("Mata in hypotenusans längd: ");
	 Get(Hc);
	 Put("Mata in vertikala katetens längd: ");
	 Get(Sa);
	 exit when (Sa > 0.0 and Hc > 0.0);
      end loop;
      
      Calculate_Angles(Hc, Sa, Va, Vb, Vc);
      
      Put("Va: ");
      Put(Va, 1, 1, 0);
      Put(" grader");
      New_Line;
      Put("Vb: ");
      Put(Vb, 1, 1, 0);
      Put(" grader");
      New_Line;
      Put("Vc: ");
      Put(Vc, 1, 1, 0);
      Put(" grader");
      New_Line;
      New_Line;
      
   end Angle_Program;
   
-------------------------------------------------------------------------
   
   function Calculate_Factorial (N : in Integer) return Integer is
      
      Nfaculty : Integer := 1;
      
   begin
      for X in 1..N loop
	 Nfaculty := Nfaculty*X;
      end loop;
      return Nfaculty;
      
   end Calculate_Factorial; 
	 
   
-------------------------------------------------------------------------
   
   procedure Factorial_Program is
      N : Integer;
      Faculty : Integer;
      
   begin
      loop
	 Put("Mata in N: ");
	 Get(N);
	 exit when (N >= 0);
	 Put_Line("Felaktigt värde!");
      end loop;
      
      Faculty := Calculate_Factorial(N);
      Put(N, 0);
      Put("-fakultet = ");
      Put(Faculty, 0);
      New_Line;
      New_Line;
      
   end Factorial_Program;

   
-------------------------------------------------------------------------
   
   
      Choice : Integer;
   
   
begin
   Put_line("Välkommen till miniräknaren!");
   
   loop
      Menu_Selection(Choice);
         if Choice = 1 then
	    Hypothenuse_Program;
	 
	 elsif Choice = 2 then
	    Angle_Program;
	    
	 elsif Choice = 3 then
	    Factorial_Program;
	    
	 end if;
	 
	 exit when (Choice = 4);
	 
   end loop;
   Put_Line("Ha en bra dag!");
   
   
end Calculator;
