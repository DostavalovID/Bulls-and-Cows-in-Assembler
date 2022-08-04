%include "io.inc"
section .data
notcows db 17,17,17,17,17,17,17,17,17,17
badnumber db 17,17,17,17,17,17,17,17,17,17
cows db 17,17,17,17
bulls db 17,17,17,17
pnum db 0,0,0,0
nnum db 0,0,0,0
pbulls db 0
pcows db 0
psum db 0
nbulls db 0
ncows db 0
nsum db 0
beginsum db 0
cowsfound db 0
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax, eax
    xor ebx,ebx
    xor ecx,ecx
    xor edx,edx
    xor esi,esi
   ; BN:
    ;mov byte [badnumber+esi],17
    ;inc esi
    ;cmp esi,10
    ;jl BN
    ;xor esi,esi
    ;NC:
    ;mov byte [notcows+esi],17
    ;inc esi
    ;cmp esi,10
    ;jl NC
    ;xor esi,esi
    ;C:
    ;mov byte [cows+esi],17
    ;inc esi
    ;cmp esi,4
    ;jl C
    ;xor esi,esi
    ;B:
    ;mov byte [bulls+esi],17
    ;inc esi
    ;cmp esi,4
    ;jl B
    ;xor esi,esi
    MAS1:
    mov byte [pnum],3
    mov byte [pnum+1],2
    mov byte [pnum+2],1
    mov byte [pnum+3],0
    PRINT_FIRST:
    PRINT_UDEC 1,[pnum+esi]
    inc esi
    cmp esi,4
    jl PRINT_FIRST
    NEWLINE
    ;������� ������ ����� �� ������������
    PRINT_STRING "Please enter first bulls then cows"
    NEWLINE
    GET_UDEC 1,[pbulls]
    GET_UDEC 1,[pcows]
    xor bx,bx
    mov cl,[pbulls]
    cmp cx,4
    je WIN ;���� � ������� ���� ������� 4 ����
    add cl,[pcows] ;���� � ������� ���� ������� 4 ������
    cmp cl,4
    je PCE
    jne WEITER
    PCE:  ;����� ������ ������ � ������ ����� � �������� � ������ �����
    mov bl,[pnum]
    mov [cows],bl
    mov bl,[pnum+1]
    mov [cows+1],bl
    mov bl,[pnum+2]
    mov [cows+2],bl
    mov bl, [pnum+3]
    mov [cows+3],bl
    xor bx,bx
    xor dx,dx
    xor edi,edi
        LOOP_PCE:
        cmp dl,[cows]
        je EQ_LOOP_PCE
        cmp dl,[cows+1]
        je EQ_LOOP_PCE
        cmp dl,[cows+2]
        je EQ_LOOP_PCE
        cmp dl,[cows+3]
        je EQ_LOOP_PCE
        jmp NEQ_LOOP_PCE
        EQ_LOOP_PCE:
        inc dl
        cmp dl,10
        jge BULLS_SEARCH
        jmp LOOP_PCE
        NEQ_LOOP_PCE:
        NEQ_LOOP_LOOP_PCE:
        mov bl,[notcows+edi]
        cmp bl,17
        jne NC_NEQ_LOOP
        mov [notcows+edi],dl
        inc dl
        cmp dl,10
        jge BULLS_SEARCH
        xor edi,edi
        jmp LOOP_PCE
        NC_NEQ_LOOP:
        inc edi
        jmp NEQ_LOOP_LOOP_PCE
    WEITER:
    add bl,[pbulls]
    add bl,[pcows]
    mov [psum],bl
    mov [beginsum],bl
    xor eax,eax
    mov bl,4
    NEXT_NUMBER:
    xor esi,esi
   ; PRINT_STRING "Massive of cows "
    ;PRINT_COWS: ;�������� ������ �����
    ;   PRINT_UDEC 1,[cows+esi]
   ;     PRINT_STRING " "
   ;     inc esi
   ;     cmp esi,4
   ;     jl PRINT_COWS
   ; xor esi,esi
   ; PRINT_STRING "Massive of notcows "
    ;PRINT_NOTCOWS: ;�������� ������ �������
        ;PRINT_UDEC 1,[notcows+esi]
       ; PRINT_STRING " "
      ;  inc esi
     ;   cmp esi,10
    ;    jl PRINT_NOTCOWS
   ; xor esi,esi
   ; PRINT_STRING "Massive of badnumber "
    ;PRINT_BADNUMBER: ;�������� ������ �������
       ; PRINT_UDEC 1,[badnumber+esi]
       ;PRINT_STRING " "
       ; inc esi
      ;  cmp esi,10
     ;   jl PRINT_BADNUMBER  
    cmp bl,10
    jge PRE_NEXT_STEP
    jmp DALSHE
    PRE_NEXT_STEP:
    mov cl,1
    jmp NEXT_STEP
    DALSHE:
    mov byte [nnum],3
    mov byte [nnum+1],2
    mov byte [nnum+2],1
    mov byte [nnum+3],bl
    xor esi,esi
    
    PRINT_SECOND:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl PRINT_SECOND
    NEWLINE
    ;������� �� ���� ��������� ������� �����
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,4 ;���� �� ������� ���� ������� 4 ����
    je WIN
    add cl,[ncows] ;���� �� ������� ���� ������� 4 ������
    cmp cl,4
    je NCE
    jne WEITER1
    
    
    NCE: ; ����� �������� ������ � ������ ����� � �������� � ������ �����
    mov al,[nnum]
    mov [cows],al
    mov al,[nnum+1]
    mov [cows+1],al
    mov al,[nnum+2]
    mov [cows+2],al
    mov al, [nnum+3]
    mov [cows+3],al
    xor ax,ax
    xor dl,dl
    xor edi,edi
        LOOP_NCE:
        cmp dl,[cows]
        je EQ_LOOP_NCE
        cmp dl,[cows+1]
        je EQ_LOOP_NCE
        cmp dl,[cows+2]
        je EQ_LOOP_NCE
        cmp dl,[cows+3]
        je EQ_LOOP_NCE
        jmp NEQ_LOOP_NCE
        EQ_LOOP_NCE:
        inc dl
        cmp dl,10
        jge BULLS_SEARCH
        jmp LOOP_NCE
        NEQ_LOOP_NCE:
        NEQ_LOOP_LOOP_NCE:
        mov bl,[notcows+edi]
        cmp bl,17
        jne NNC_NEQ_LOOP
        mov [notcows+edi],dl
        inc dl
        cmp dl,10
        jge BULLS_SEARCH
        xor edi,edi
        jmp LOOP_NCE
        NNC_NEQ_LOOP:
        inc edi
        jmp NEQ_LOOP_LOOP_NCE
    
    
    
    
    WEITER1:
    xor ax,ax
    xor cx,cx
    add cl,[nbulls]
    add cl,[ncows]
    mov [nsum],cl
    mov dl,[nsum]
    cmp dl,[psum]
    je EQ1  ;���� ����� �������� ����� ����������
    jg BIGSUM ;���� ����� �������� ������ ����������
    jl SMALLSUM ;���� ����� �������� ������ ����������
    
    EQ1: ;��������� ��� �� ������� �������, ��� �� ������� ��� ��������� ���
    mov dl,[pnum+3]
    xor esi,esi
    
    LOOPCOWS:
    cmp dl,[cows+esi]
    je WRITECOW ;���� ������� ���
    inc esi
    cmp esi,4
    jl LOOPCOWS
    xor esi,esi
    jmp LOOPNOTCOWS
    WRITECOW: ;���� ��������� ����� ����� ���� ���� ���� ����������
    xor esi,esi
    mov al,[cows+esi]
    cmp al,17
    jne WCNE
    je WCE
    WCNE:
    inc esi
    mov al,[cows+esi]
    cmp al,17
    jne WCNE
    WCE:
    mov dl,[nnum+3]
    mov [cows+esi],dl
    xor esi,esi
    mov [pnum+3],dl ;�������� ���������� ���������� � ��������� �� ��������� ���
    xor dl,dl
    mov dl,[nsum]
    mov [psum],dl
    inc bl
    jmp NEXT_NUMBER
    
    LOOPNOTCOWS: ;���� ����� ������� �������
    cmp dl,[notcows+esi] ;dl ����� [pnum+3]
    je WRITENOTCOW ;���� ��� ���������
    inc esi
    cmp esi,10
    jl LOOPNOTCOWS
    xor esi,esi
    jmp LOOPBADNUMBER
    WRITENOTCOW: ;���� ��������� ����� ������� ���� ���� ���� ����������
    xor esi,esi
    mov al,[notcows+esi]
    cmp al,17
    jne WNCNE
    je WNCE
    WNCNE: ;���� ��������� �����
    inc esi
    mov al,[notcows+esi]
    cmp al,17
    jne WNCNE
    WNCE: ;�����, �������� ����� ����� � ��������
    mov dl,[nnum+3]
    mov [notcows+esi],dl
    xor esi,esi
    mov [pnum+3],dl
    xor dl,dl
    mov dl,[nsum]
    mov [psum],dl
    inc bl
    jmp NEXT_NUMBER
    
    
    
    LOOPBADNUMBER: 
    xor esi,esi
    mov al,[badnumber+esi]
    cmp al,17
    jne BNNE
    je BNE
    BNNE: 
    inc esi
    mov al,[badnumber+esi]
    cmp al,17
    jne BNNE
    BNE:
    mov dl, [pnum+3]
    xor edi,edi
    BNELOOP:;���������� �� ���� �� ����������� ��� � ��� ������, ����� �� �������� ��� ��� ����
    cmp dl,[badnumber+edi]
    je WITHOUT_PNUM
    inc edi
    cmp edi,10
    jl BNELOOP
    mov [badnumber+esi],dl ;�������� ���������� �����
    WITHOUT_PNUM:
    mov dl,[nnum+3]
    inc esi
    mov [badnumber+esi],dl ;�������� �������� �����
    xor esi,esi
    mov [pnum+3],dl ;�������� ���������� ���������� � �� ��������� ���
    xor dl,dl
    mov dl,[nsum]
    mov [psum],dl
    inc bl
    jmp NEXT_NUMBER
    
    BIGSUM: ;���� �������� ����� ������ ����������
        xor dl,dl ;[nnum+3] ����� ������
        xor esi,esi
        mov dl,[nnum+3]
        BSLOOP:
            mov cl,[cows+esi]
            cmp cl,17
            je BSLE
            inc esi
            jmp BSLOOP
        BSLE:
        mov [cows+esi],dl
        
        xor dl,dl     
        xor esi,esi   
        mov dl,[pnum+3]
        LOOPBS: ;������� �� ���� �� � ��������� �����������
            cmp dl,[badnumber+esi]
            je LIQBN ;���� ���, �� ������������ ���� ��������� � �������
            inc esi
            cmp esi,10
            jge WASNT_IN_BN ;���� �� ���� ����� �������� � badnumbers
            jmp LOOPBS ;���� ��� �� ���������, ������������
        LIQBN: ;���������� ��� ������
            xor esi,esi
            LOOPLIQ:
                xor dl,dl
                mov dl,[badnumber+esi] ;���� ���������(!=17)������ � ���������� ��� � ������ � �������
                cmp dl,17
                jne WRT_BNM_NOTCOW ;����� ���������, ������� ��� � ��������
                JMP_FROM_WRT:
                    inc esi
                    cmp esi,10
                    jge JGE_WRT
                    jmp LOOPLIQ
            JGE_WRT:
                inc bl
                mov dl,[nsum]
                mov [psum],dl
                mov dl,[nnum+3]
                mov [pnum+3],dl
                jmp NEXT_NUMBER
       
        WRT_BNM_NOTCOW: ;���������� ��������� ������ � ������
            xor edi,edi
        LOOPWBN: ;���� ��������� ����� � �������
            mov cl,[notcows+edi]
            cmp cl,17
            je WRTNOTCOW
            inc edi
            jmp LOOPWBN
        WRTNOTCOW: ;����� ��������� ����� � ��������� � ������� ��� ����
            mov [notcows+edi],dl ;������� ���������
            mov byte [badnumber+esi],17;��� ��������� ������� �������, �������
            jmp JMP_FROM_WRT ;������������, ���������� ������������� ������
    WASNT_IN_BN:;�� ��� � ������
        mov dl,[pnum+3] ;������ ������ [pnum+3] � ��������� notcows � �������
        xor esi,esi
        LOOPFREENC:
        mov cl,[notcows+esi]
        cmp cl,17
        je WRTFREENC
        cmp dl,[notcows+esi]
        je END_WRTFREENC
        inc esi
        jmp LOOPFREENC
        WRTFREENC:
            mov [notcows+esi],dl ;�������� ���� ������� � ��������� � ����. ����
            END_WRTFREENC:
            inc bl
            mov dl,[nsum]
            mov [psum],dl
            mov dl,[nnum+3]
            mov [pnum+3],dl
            jmp NEXT_NUMBER
    
    
    SMALLSUM: ;���� �������� ����� ������ ����������
    cmp bl,4 ;�������� ���� ������ ������, �� �������� ��������� ����� �� 1(�� �����������)
    jne NE4
    mov dl,[beginsum]
    dec dl
    mov [beginsum],dl
    xor dl,dl
    NE4:
        xor dl,dl ;[nnum+3] ����� ��������
        xor esi,esi
        mov dl,[nnum+3]
        SSLOOP:
            mov cl,[notcows+esi]
            cmp cl,17
            je SSLE
            inc esi
            jmp SSLOOP
        SSLE:
        mov [notcows+esi],dl
        
        xor dl,dl        
        mov dl,[pnum+3]
        xor esi,esi
        LOOPSS: ;������� �� ���� �� � ��������� �����������
            cmp dl,[badnumber+esi]
            je LIQBNSS ;���� ���, �� ������������ ���� ��������� � �����
            inc esi
            cmp esi,10
            jge WASNT_IN_BNSS ;���� �� ���� ����� �������� � badnumbers
            jmp LOOPSS ;���� ��� �� ���������, ������������
        LIQBNSS: ;���������� ��� ������
            xor esi,esi
            LOOPLIQSS:
                xor dl,dl
                mov dl,[badnumber+esi];���� ���������(!=17)������ � ���������� ��� � ����� � �������
                cmp dl,17
                jne WRT_BNM_COW ;����� ���������, ������� ��� � ������
                JMP_FROM_WRTSS:
                    inc esi
                    cmp esi,10
                    jge JGE_WRTSS
                    jmp LOOPLIQSS
            JGE_WRTSS:
                inc bl
                mov dl,[nsum]
                mov [psum],dl
                mov dl,[nnum+3]
                mov [pnum+3],dl
                jmp NEXT_NUMBER
       
        WRT_BNM_COW: ;���������� ��������� ������ � ������
            xor edi,edi
        LOOPWBNSS: ;���� ��������� ����� � �������
            mov cl,[cows+edi]
            cmp cl,17
            je WRTCOW
            inc edi
            jmp LOOPWBNSS
        WRTCOW: ;����� ��������� ����� � ������� � ������� ��� ����
            mov [cows+edi],dl ;������� ���������
            mov byte [badnumber+esi],17;��� ��������� ������� �������, �������
            jmp JMP_FROM_WRTSS ;������������, ���������� ������������� ������
    WASNT_IN_BNSS:;�� ��� � ������
        mov dl,[pnum+3] ;������ ������ [pnum+3] � ��������� cows � �������
        xor esi,esi
        LOOPFREEC_SS:
        mov cl,[cows+esi]
        cmp cl,17
        je WRTFREEC_SS
        cmp dl,[cows+esi]
        je END_WRTFREEC_SS
        inc esi
        jmp LOOPFREEC_SS
        WRTFREEC_SS:
            mov [cows+esi],dl ;�������� ���� ������� � ��������� � ����. ����
            END_WRTFREEC_SS:
            inc bl
            mov dl,[nsum]
            mov [psum],dl
            mov dl,[nnum+3]
            mov [pnum+3],dl
            jmp NEXT_NUMBER
                
    NEXT_STEP:
        xor eax,eax
        xor ebx,ebx
        xor esi,esi
        COWS_FOUND: ;������� ������� ����� �����
        mov al,[cows+esi]
        cmp al,17
        jne CFNE
        inc esi
        cmp esi,4
        jl COWS_FOUND
        jmp EXITCF
        CFNE:
        inc bl
        inc esi
        cmp esi,4
        jl COWS_FOUND
        EXITCF:
        mov [cowsfound],bl ;��������� ���������� �����, ���� 4 ��������� � ������ �����
        PRINT_STRING "Cows count : "
        PRINT_UDEC 1,[cowsfound]
        NEWLINE
        cmp bl,4
        je BULLS_SEARCH
        xor esi,esi
        xor edi,edi
        mov edi,3
        LAST_COWS: ;�������� ����� ���������� � ����� ������,������� ���������
        mov dl,[notcows+esi]
        mov [nnum+edi],dl
        inc esi
        dec edi
        cmp esi,3
        jl LAST_COWS
        xor edx,edx
        mov [nnum],cl
        xor esi,esi
        PRINT_LAST_COWS:
        PRINT_UDEC 1,[nnum+esi]
        inc esi
        cmp esi,4
        jl PRINT_LAST_COWS
        xor esi,esi
        NEWLINE
        GET_UDEC 1,[nbulls]
        GET_UDEC 1,[ncows]
        add dl,[nbulls]
        add dl,[ncows]
        cmp dl,1
        je WRITE_LAST_COWS
        jne WRITE_LAST_NOTCOWS
        
        WRITE_LAST_COWS:
        mov al,[cows+esi]
        cmp al,17
        je WRT_LAST_COW
        inc esi
        jmp WRITE_LAST_COWS
        WRT_LAST_COW:
        mov [cows+esi],cl
        inc cl
        xor esi,esi
        jmp NEXT_STEP
        
        WRITE_LAST_NOTCOWS:
        mov al,[notcows+esi]
        cmp al,17
        je WRT_LAST_NOTCOW
        inc esi
        jmp WRITE_LAST_NOTCOWS
        WRT_LAST_NOTCOW:
        mov [notcows+esi],cl
        inc cl
        xor esi,esi
        jmp NEXT_STEP
        
       
    BULLS_SEARCH:    
    PRINT_STRING "Cows are: "
    xor esi,esi
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    xor edx,edx
    PRINT_COWS_B:
    PRINT_UDEC 1,[cows+esi]
    inc esi
    cmp esi,4
    jl PRINT_COWS_B
    xor esi,esi
    mov edi,3
    NEWLINE
    PRINT_STRING "I am on bulls search maaaan"
    NEWLINE
    BEGIN_OF_THE_END:
    FS_1:
    mov dl,[cows]
    mov [nnum+3],dl
    mov dl,[notcows]
    mov [nnum+2],dl
    mov dl,[notcows+1]
    mov [nnum+1],dl
    mov dl,[notcows+2]
    mov [nnum],dl
    LOOP_BULLS_FS1:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_FS1
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_SECOND_STEP1
    xor ecx,ecx
    xor esi,esi
    jmp FS_2
    PRE_SECOND_STEP1:
    mov al,[nnum+3]
    mov [bulls+3],al
    xor esi,esi
    jmp SECOND_STEP
    
    FS_2:
    
    mov dl,[cows]
    mov [nnum+2],dl
    mov dl,[notcows]
    mov [nnum+3],dl
    mov dl,[notcows+1]
    mov [nnum+1],dl
    mov dl,[notcows+2]
    mov [nnum],dl
    LOOP_BULLS_FS2:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_FS2
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_SECOND_STEP2
    xor esi,esi
    xor ecx,ecx
    jmp FS_3
    PRE_SECOND_STEP2:
    mov al,[nnum+2]
    mov [bulls+2],al
    xor esi,esi
    jmp SECOND_STEP
    
    FS_3:
    
    mov dl,[cows]
    mov [nnum+1],dl
    mov dl,[notcows]
    mov [nnum+3],dl
    mov dl,[notcows+1]
    mov [nnum+2],dl
    mov dl,[notcows+2]
    mov [nnum],dl
    LOOP_BULLS_FS3:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_FS3
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_SECOND_STEP3
    xor esi,esi
    xor ecx,ecx
    jmp FS_4
    PRE_SECOND_STEP3:
    mov al,[nnum+1]
    mov [bulls+1],al
    xor esi,esi
    jmp SECOND_STEP
    
    FS_4:
    mov dl,[cows]
    mov [nnum],dl
    mov dl,[notcows]
    mov [nnum+3],dl
    mov dl,[notcows+1]
    mov [nnum+2],dl
    mov dl,[notcows+2]
    mov [nnum+1],dl
    LOOP_BULLS_FS4:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_FS4
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_SECOND_STEP4
    xor esi,esi
    xor ecx,ecx
    jmp SECOND_STEP
    PRE_SECOND_STEP4:
    mov al,[nnum]
    mov [bulls],al
    xor esi,esi
    jmp SECOND_STEP
    
    SECOND_STEP:
    
    SS_1:
    
    mov dl,[cows+1]
    mov [nnum+3],dl
    mov dl,[notcows]
    mov [nnum+2],dl
    mov dl,[notcows+1]
    mov [nnum+1],dl
    mov dl,[notcows+2]
    mov [nnum],dl
    mov al,[bulls+3]
    cmp al,17
    jne SS_2
    LOOP_BULLS_SS1:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_SS1
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_THIRD_STEP1
    xor esi,esi
    xor ecx,ecx
    jmp SS_2
    PRE_THIRD_STEP1:
    mov al,[nnum+3]
    mov [bulls+3],al
    xor esi,esi
    jmp THIRD_STEP
    
        SS_2:
    
    mov dl,[cows+1]
    mov [nnum+2],dl
    mov dl,[notcows]
    mov [nnum+3],dl
    mov dl,[notcows+1]
    mov [nnum+1],dl
    mov dl,[notcows+2]
    mov [nnum],dl
    mov al,[bulls+2]
    cmp al,17
    jne SS_3
    LOOP_BULLS_SS2:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_SS2
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_THIRD_STEP2
    xor esi,esi
    xor ecx,ecx
    jmp SS_3
    PRE_THIRD_STEP2:
    xor esi,esi
    mov al,[nnum+2]
    mov [bulls+2],al
    jmp THIRD_STEP
    
      SS_3:

    mov dl,[cows+1]
    mov [nnum+1],dl
    mov dl,[notcows]
    mov [nnum+3],dl
    mov dl,[notcows+1]
    mov [nnum+2],dl
    mov dl,[notcows+2]
    mov [nnum],dl
    mov al,[bulls+1]
    cmp al,17
    jne SS_4
    LOOP_BULLS_SS3:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_SS3
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_THIRD_STEP3
    xor esi,esi
    xor ecx,ecx
    jmp SS_4
    PRE_THIRD_STEP3:
    xor esi,esi
    mov al,[nnum+1]
    mov [bulls+1],al
    jmp THIRD_STEP
    
            SS_4:
    
    mov dl,[cows+1]
    mov [nnum],dl
    mov dl,[notcows]
    mov [nnum+3],dl
    mov dl,[notcows+1]
    mov [nnum+2],dl
    mov dl,[notcows+2]
    mov [nnum+1],dl
    mov al,[bulls]
    cmp al,17
    jne THIRD_STEP
    LOOP_BULLS_SS4:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_SS4
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_THIRD_STEP4
    xor esi,esi
    xor ecx,ecx
    jmp SS_3
    PRE_THIRD_STEP4:
    xor esi,esi
    mov al,[nnum]
    mov [bulls],al
    jmp THIRD_STEP
    
    THIRD_STEP:
    
            TS_1:
    
    mov dl,[cows+2]
    mov [nnum+3],dl
    mov dl,[notcows]
    mov [nnum+2],dl
    mov dl,[notcows+1]
    mov [nnum+1],dl
    mov dl,[notcows+2]
    mov [nnum],dl
    mov al,[bulls+3]
    cmp al,17
    jne TS_2
    LOOP_BULLS_TS1:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_TS1
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_FOURTH_STEP1
    xor esi,esi
    xor ecx,ecx
    jmp TS_2
    PRE_FOURTH_STEP1:
    xor esi,esi
    mov al,[nnum+3]
    mov [bulls+3],al
    jmp FOURTH_STEP
    
                TS_2:
    
    mov dl,[cows+2]
    mov [nnum+2],dl
    mov dl,[notcows]
    mov [nnum+3],dl
    mov dl,[notcows+1]
    mov [nnum+1],dl
    mov dl,[notcows+2]
    mov [nnum],dl
    mov al,[bulls+2]
    cmp al,17
    jne TS_3
    LOOP_BULLS_TS2:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_TS2
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_FOURTH_STEP2
    xor esi,esi
    xor ecx,ecx
    jmp TS_3
    PRE_FOURTH_STEP2:
    xor esi,esi
    mov al,[nnum+2]
    mov [bulls+2],al
    jmp FOURTH_STEP
    
                TS_3:
    
    mov dl,[cows+2]
    mov [nnum+1],dl
    mov dl,[notcows]
    mov [nnum+3],dl
    mov dl,[notcows+1]
    mov [nnum+2],dl
    mov dl,[notcows+2]
    mov [nnum],dl
    mov al,[bulls+1]
    cmp al,17
    jne TS_4
    LOOP_BULLS_TS3:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_TS3
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_FOURTH_STEP3
    xor esi,esi
    xor ecx,ecx
    jmp TS_4
    PRE_FOURTH_STEP3:
    xor esi,esi
    mov al,[nnum+1]
    mov [bulls+1],al
    jmp FOURTH_STEP
    
                TS_4:
    
    mov dl,[cows+2]
    mov [nnum],dl
    mov dl,[notcows]
    mov [nnum+3],dl
    mov dl,[notcows+1]
    mov [nnum+2],dl
    mov dl,[notcows+2]
    mov [nnum+1],dl
    mov al,[bulls]
    cmp al,17
    jne FOURTH_STEP
    LOOP_BULLS_TS4:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_TS4
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_FOURTH_STEP4
    xor esi,esi
    xor ecx,ecx
    jmp FOURTH_STEP
    PRE_FOURTH_STEP4:
    xor esi,esi
    mov al,[nnum]
    mov [bulls],al
    jmp FOURTH_STEP
    
    
    FOURTH_STEP:
    
           FTS_1:
    
    mov dl,[cows+3]
    mov [nnum+3],dl
    mov dl,[notcows]
    mov [nnum+2],dl
    mov dl,[notcows+1]
    mov [nnum+1],dl
    mov dl,[notcows+2]
    mov [nnum],dl
    mov al,[bulls+3]
    cmp al,17
    jne FTS_2
    LOOP_BULLS_FTS1:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_FTS1
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_WIN_STEP1
    xor esi,esi
    xor ecx,ecx
    jmp FTS_2
    PRE_WIN_STEP1:
    xor esi,esi
    mov al,[nnum+3]
    mov [bulls+3],al
    jmp FINAL_WIN
    
          FTS_2:
    
    mov dl,[cows+3]
    mov [nnum+2],dl
    mov dl,[notcows]
    mov [nnum+3],dl
    mov dl,[notcows+1]
    mov [nnum+1],dl
    mov dl,[notcows+2]
    mov [nnum],dl
    mov al,[bulls+2]
    cmp al,17
    jne FTS_3
    LOOP_BULLS_FTS2:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_FTS2
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_WIN_STEP2
    xor esi,esi
    xor ecx,ecx
    jmp FTS_3
    PRE_WIN_STEP2:
    xor esi,esi
    mov al,[nnum+2]
    mov [bulls+2],al
    jmp FINAL_WIN
    
            FTS_3:
    
    mov dl,[cows+3]
    mov [nnum+1],dl
    mov dl,[notcows]
    mov [nnum+3],dl
    mov dl,[notcows+1]
    mov [nnum+2],dl
    mov dl,[notcows+2]
    mov [nnum],dl
    mov al,[bulls+1]
    cmp al,17
    jne FTS_4
    LOOP_BULLS_FTS3:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_FTS3
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_WIN_STEP3
    xor esi,esi
    xor ecx,ecx
    jmp FTS_4
    PRE_WIN_STEP3:
    xor esi,esi
    mov al,[nnum+1]
    mov [bulls+1],al
    jmp FINAL_WIN
    
          FTS_4:
    
    mov dl,[cows+3]
    mov [nnum],dl
    mov dl,[notcows]
    mov [nnum+3],dl
    mov dl,[notcows+1]
    mov [nnum+2],dl
    mov dl,[notcows+2]
    mov [nnum+1],dl
    mov al,[bulls]
    cmp al,17
    jne FINAL_WIN
    LOOP_BULLS_FTS4:
    PRINT_UDEC 1,[nnum+esi]
    inc esi
    cmp esi,4
    jl LOOP_BULLS_FTS4
    PRINT_STRING " "
    GET_UDEC 1,[nbulls]
    GET_UDEC 1,[ncows]
    mov cl,[nbulls]
    cmp cl,1
    je PRE_WIN_STEP4
    xor esi,esi
    xor ecx,ecx
    jmp FINAL_WIN
    PRE_WIN_STEP4:
    xor esi,esi
    mov al,[nnum]
    mov [bulls],al
    jmp FINAL_WIN
    
    WIN:
    PRINT_STRING "Yeah, I got it :)"
    jmp OUT_GAME
    FINAL_WIN:
    xor esi,esi
    PRINT_STRING "Your number is "
    PRINT_WIN:
        PRINT_UDEC 1,[bulls+esi]
        inc esi
        cmp esi,4
        jl PRINT_WIN
        NEWLINE
        PRINT_STRING "Finally I won...  :)"
        OUT_GAME:
        GET_CHAR dl
        GET_CHAR dl
    
    ret