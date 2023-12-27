# Prayer Time Calculator

## Overview

This assembly code calculates the remaining time until the next prayer based on user input. It supports Fajr, Dhuhr, Asr, Maghrib, and Isha prayers.

## Team
- Donia Hussien Mohamed
- Haneen Adel Mohamed 

## Usage

1. **Run the Program:**
   - Ensure that you are using an x86 environment.
   - Tasm program

2. **Enter the Hour:**
   - The program prompts the user to enter the current hour (in the range 01-24).
   - hour that contain one digit must write 0 before it 
   - Follow the on-screen instructions to input the hour.

3. **View Output:**
   - The program displays the next prayer and the remaining time until that prayer.
   - Output includes visual elements like hearts and newlines for better readability.

## Code Structure

### Data Section

- `first_digit`, `second_digit`, `hour`: Variables for user input.
- `hearts`, `newline`: Visual elements for output.
- `output_msg`, `output_time`, `output`: Messages displayed to the user.
- Prayer hours and messages for Fajr, Dhuhr, Asr, Maghrib, and Isha.

### Code Section

1. **User Input Validation:**
   - Ensures the entered hour is between 01 and 24.

2. **Output Display:**
   - Prints messages, visual elements, and calculates the remaining time until the next prayer.

3. **Prayer Time Calculation:**
   - Determines the next prayer based on the entered hour.


