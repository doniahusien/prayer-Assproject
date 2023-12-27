.MODEL SMALL
.STACK 200h
.DATA
    first_digit db ?
    second_digit db ?
    hour db ?
    
    
    hearts db 80 DUP(3),"$"
    newline db 13,10,"$"
    output_msg db "Next Prayer is: $"
    output_time db 'Enter the hour (01-24): $'
    output db 'Remining Time is about : $'
    
    fajr_hour db 3
    dhuhr_hour db 12
    asr_hour db 15
    maghrib_hour db 17
    isha_hour db 19
    
    fajr_msg db 'Fajr$'
    dhuhr_msg db 'Dhuhr$'
    asr_msg db 'Asr$'
    maghrib_msg db 'Maghrib$'
    isha_msg db 'Isha$'
.386 
.CODE
main proc far
    .startup
      
 mov ah, 09h
 lea dx, hearts
 int 21h
 lea dx,newline
 int 21h

    
    
    ; Input validation loop
get_input:
    
    ; message user to enter the hour
    mov ah, 09h
    lea dx,newline
    int 21h
    lea dx, output_time
    int 21h


    ; Read two characters of user input
    mov ah, 01h
    int 21h
    mov first_digit, al
    
    mov ah, 01h
    int 21h
    mov second_digit, al

    ; Convert ASCII to integer
   sub first_digit, '0'
   sub second_digit, '0'
    
    ; Combine the digits into a two-digit number
    mov ah, 0
    mov al, first_digit
    mov bl, 10
    mul bl
    add al, second_digit
    mov hour, al

    ; Check if entered_hour is between 1 and 24
    cmp hour, 1
    jb get_input
    cmp hour, 24
    ja get_input
    
    
    
    
 mov ah, 09h
 lea dx,newline
 int 21h
  lea dx,newline
 int 21h
 
 lea dx, hearts
 int 21h
  lea dx,newline
 int 21h

 
 
    ; Print output message
    mov ah, 09h
    lea dx, output_msg
    int 21h
  

    ; Check which prayer is next based on the entered hour
    mov ah, hour

    cmp ah, isha_hour
    jae calculate_isha_to_fajr
    cmp ah, fajr_hour
    jb print_fajr
    cmp ah, dhuhr_hour
    jb print_dhuhr
    cmp ah, asr_hour
    jb print_asr
    cmp ah, maghrib_hour
    jb print_maghrib
    cmp ah,isha_hour
    jb print_isha
    jmp done
    
    
print_fajr:
    mov ah, 09h
    lea dx,fajr_msg
    int 21h
    
    
    lea dx, newline
    int 21h
    
    
    lea dx, newline
    int 21h
    
    lea dx,hearts
    int 21h
    
          lea dx, newline
    int 21h
    
    
    lea dx,output
    int 21h
    

    ; Calculate and print the hours to the next Fajr
    
    mov dl, fajr_hour
    sub dl, hour
    add dl, '0'
    mov ah, 02h
    int 21h
    jmp done

print_dhuhr:
    mov ah, 09h
    lea dx, dhuhr_msg
    int 21h
    
    
    lea dx, newline
    int 21h
    
    
    lea dx, newline
    int 21h
    
    lea dx,hearts
    int 21h
    
          lea dx, newline
    int 21h
    
    
    lea dx,output
    int 21h
    
    ; Calculate and print the hours to the next Dhuhr
    mov dl, dhuhr_hour
    sub dl, hour
    add dl, '0'
    mov ah, 02h
    int 21h
    jmp done

print_asr:
    mov ah, 09h
    lea dx, asr_msg
    int 21h
    
    lea dx, newline
    int 21h
    
    
    lea dx, newline
    int 21h
    
    lea dx,hearts
    int 21h
    
          lea dx, newline
    int 21h
    
    
    lea dx,output
    int 21h
    
    ; Calculate and print the hours to the next Asr
    mov dl, asr_hour
    sub dl, hour
    add dl, '0'
    mov ah, 02h
    int 21h
    jmp done

print_maghrib:
    mov ah, 09h
    lea dx, maghrib_msg
    int 21h

    lea dx, newline
    int 21h
    
    
    lea dx, newline
    int 21h
    
    lea dx,hearts
    int 21h
    
          lea dx, newline
    int 21h
    
    
    lea dx,output
    int 21h
    
    ; Calculate and print the hours to the next Maghrib
    mov dl, maghrib_hour
    sub dl, hour
    add dl, '0'
    mov ah, 02h
    int 21h
    jmp done
    
    
print_isha:
    mov ah, 09h
    lea dx, isha_msg
    int 21h
    
    lea dx, newline
    int 21h
    
    
    lea dx, newline
    int 21h
    
    lea dx,hearts
    int 21h
    
          lea dx, newline
    int 21h
    
    
    lea dx,output
    int 21h
    

    ; Calculate and print the hours to the next Isha
    mov dl, isha_hour
    sub dl,hour
    add dl, '0'
    mov ah, 02h
    int 21h
    jmp done
    

calculate_isha_to_fajr:
    
    mov ah, 09h
    lea dx, fajr_msg
    int 21h
    
    lea dx, newline
    int 21h
    
    
    lea dx, newline
    int 21h
    
    lea dx,hearts
    int 21h
    
    lea dx, newline
    int 21h
    
    
    lea dx,output
    int 21h
    

    ; Calculate and print the hours from Isha to Fajr
    mov dl, fajr_hour
    add dl, 24       ;  the next day
    sub dl, hour
    add dl, '0'
    mov ah, 02h
    int 21h

done:
    .exit
    main endp
END main
