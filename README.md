
# 🦯 Walking Stick for the Visually Impaired

This project aims to design a walking stick for visually impaired people, equipped with features to enhance mobility and safety. The walking stick is activated/deactivated using a button and includes obstacle detection and fall detection functionalities.

---

## 🛠️ Features

### 1. **Activation/Deactivation**  
The walking stick can be turned **on** and **off** by the user using a button or switch.  
📲 **Inputs**:  
- Reset Button  
- Activation Button

### 2. **Obstacle Detection**  
Using an obstacle avoidance sensor, the stick vibrates whenever an obstacle is detected ahead, alerting the user.  
🕵️‍♂️ **Inputs**:  
- Distance Echo Signal (from obstacle avoidance sensor)  
🎛️ **Output**:  
- Vibration Trigger (vibrating motor)

### 3. **Fall Detection**  
The stick detects if it falls from the user's hand. Once it is detected as dropped, it keeps emitting a beep sound until it is located.  
🧠 **Inputs**:  
- Touch Sensor (detects if the stick has fallen)  
🎶 **Output**:  
- Buzzer (warning sound)

---

## ⚙️ Files Included

- `.vhdl` - VHDL code for FPGA implementation  
- `.qpf` - Quartus project file  
- `.qsf` - Quartus settings file for pin assignments  

---

## 💡 VHDL Code Logic Overview

### **Module: `sumbission`**  
This module defines the functionality of the walking stick, including the activation/deactivation, obstacle detection, and fall detection.

- **Inputs**:  
  - `Reset`: Resets the system to its initial state.  
  - `IsActive`: The button switch for activating or deactivating the walking stick.  
  - `Touch`: Detects if the stick has fallen.  
  - `Distance_echo`: Signal from the obstacle avoidance sensor.  

- **Outputs**:  
  - `Buzzer`: A buzzer sound when the stick falls.  
  - `Vibrator_trig`: Triggers vibration when an obstacle is detected.

---

## 📝 Code Snippets

```vhdl
-- Process for controlling the Buzzer (Fall Detection)
PROCESS (Reset, IsActive, Touch)
    BEGIN
        IF Reset = '0' THEN 
            Buzzer <= '0'; 
        ELSE
            IF IsActive = '1' THEN
                IF Touch = '1' THEN 
                    Buzzer <= '0';  -- Turn off buzzer when the stick is not dropped
                ELSE 
                    Buzzer <= '1';  -- Beep if the stick is dropped
                END IF;
            ELSE 
                Buzzer <= '0'; 
            END IF;
        END IF;
END PROCESS;
```

```vhdl
-- Process for controlling the Vibrator (Obstacle Detection)
PROCESS (Reset, IsActive, Distance_echo)
    BEGIN
        IF Reset = '0' THEN 
            Vibrator_trig <= '0'; 
        ELSE
            IF IsActive = '1' THEN
                IF Distance_echo = '0' THEN 
                    Vibrator_trig <= '0';  -- No obstacle, no vibration
                ELSE 
                    Vibrator_trig <= '1';  -- Vibration when an obstacle is detected
                END IF;
            ELSE 
                Vibrator_trig <= '0'; 
            END IF;
        END IF;
END PROCESS;
```

---

## 📋 Installation and Setup

1. Clone the repository to your local machine.
2. Open the project in **Quartus** software using the `.qpf` file.
3. Connect the FPGA hardware to your computer.
4. Set up the necessary sensors (obstacle detection, touch sensor, and vibrator).
5. Compile the project and upload the configuration to the FPGA.

---

## ⚡️ Enjoy the Project!  

We hope this walking stick helps visually impaired individuals with their mobility and safety. Let us know if you have any ideas to improve it! 😊

---
