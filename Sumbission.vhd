LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_ARITH.ALL;
USE ieee.std_logic_UNSIGNED.ALL;

ENTITY sumbission IS
PORT ( 
    Reset: IN STD_LOGIC;
    IsActive: IN STD_LOGIC;
    Touch: IN STD_LOGIC;
    Distance_echo: IN STD_LOGIC;
    Buzzer: OUT STD_LOGIC;
   -- Distance_trig: OUT STD_LOGIC;
    Vibrator_trig: OUT STD_LOGIC
);
END sumbission;

ARCHITECTURE WalkingStick_arch2 OF sumbission IS 
BEGIN
PROCESS (Reset, IsActive, Touch)
    BEGIN
    
        IF Reset = '0' THEN 
            Buzzer <= '0'; 
           
        ELSE
            IF IsActive = '1' THEN
                -- Change the logic for the buzzer
                IF Touch = '1' THEN 
                    Buzzer <= '0';  -- Turn the buzzer ON when touch is not pressed
                ELSE 
                    Buzzer <= '1';  -- Turn the buzzer OFF when touch is pressed
                END IF;
                ELSE 
                Buzzer <= '0'; 
            END IF;
        END IF;
    
END PROCESS;
PROCESS (Reset, IsActive, Distance_echo)
    BEGIN
    
        IF Reset = '0' THEN 
            Vibrator_trig <= '0'; 
           
        ELSE
            IF IsActive = '1' THEN
                -- Change the logic for the buzzer
                IF Distance_echo = '0' THEN 
                    Vibrator_trig <= '0';  -- Turn the buzzer ON when touch is not pressed
                ELSE 
                    Vibrator_trig <= '1';  -- Turn the buzzer OFF when touch is pressed
                END IF;
                ELSE 
                Vibrator_trig <= '0'; 
            END IF;
        END IF;
    
END PROCESS;






END WalkingStick_arch2;