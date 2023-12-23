.MODEL SMALL
.STACK 100h
.DATA
    entered_hour db 14   ; Example entered hour, you can change this value
    output_msg db 13, 10, "Next Prayer is: $"
    output_time db 'Remining time for pray$'
    
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

.CODE
main proc far
    .startup

    ; Print output message
    mov ah, 09h
    lea dx, output_msg
    int 21h


    ; Check which prayer is next based on the entered hour
    mov ah, entered_hour

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
    jmp done
    
    
    
    

print_fajr:
    mov ah, 09h
    lea dx, fajr_msg
    int 21h
    ; Calculate and print the hours to the next Fajr
    mov dl, fajr_hour
    sub dl, entered_hour
    add dl, '0'
    mov ah, 02h
    int 21h
    jmp done

print_dhuhr:
    mov ah, 09h
    lea dx, dhuhr_msg
    int 21h
    ; Calculate and print the hours to the next Dhuhr
    mov dl, dhuhr_hour
    sub dl, entered_hour
    add dl, '0'
    mov ah, 02h
    int 21h
    jmp done

print_asr:
    
    mov ah, 09h
    lea dx, asr_msg
    int 21h
    ; Calculate and print the hours to the next Asr
     
    mov dl, asr_hour
    sub dl, entered_hour
    
    add dl, '0'
    mov ah, 02h
    int 21h
    jmp done

print_maghrib:
    mov ah, 09h
    lea dx, maghrib_msg
    int 21h
    ; Calculate and print the hours to the next Maghrib
    mov dl, maghrib_hour
    sub dl, entered_hour
    add dl, '0'
    mov ah, 02h
    int 21h
    jmp done
    
    
    
    

calculate_isha_to_fajr:
    mov ah, 09h
    lea dx, fajr_msg
    int 21h
    ; Calculate and print the hours from Isha to Fajr
    mov dl, fajr_hour
    add dl, 24       ; Add 24 hours to represent the next day
    sub dl, entered_hour
    add dl, '0'
    mov ah, 02h
    int 21h

done:
    .exit
    main endp
END main
