;-------------------------------        ;----------------------------------------
;Original code                          ;Original code after adding dead code
;-------------------------------        ;----------------------------------------
AND DWORD PTR DS:[7228D58C],0           AND DWORD PTR DS:[7228D58C],0
PUSH EAX                                PUSH EAX 
MOV ESI,EAX                             MOV ESI,EAX
TEST ESI,ESI                            TEST ESI,ESI                                             
MOVZX ESI,SI                            MOVZX ESI,SI  
OR ESI,80070000                         OR ESI,80070000 
MOVZX EAX,WORD PTR DS:[ECX]             MOVZX EAX,WORD PTR DS:[ECX]
PUSH EAX                                PUSH EAX
PUSH ECX                                MOV [EDI] 80; Garbage code. If EDI == 200 them in memory, location of 200, will be load with 80
PUSH 2                                  PUSH ECX
PUSH DWORD PTR DS:[7228D584]            PUSH 2
PUSH DWORD PTR DS:[7228D580]            PUSH DWORD PTR DS:[7228D584]
MOV ECX,DWORD PTR SS:[EBP-8]            PUSH DWORD PTR DS:[7228D580]
MOV EAX,ESI                             MOV ECX,DWORD PTR SS:[EBP-8]  
POP EDI                                 MOV EAX,ESI
XOR ECX,EBP                             PUSH EBX; Garbage code
POP ESI                                 POP EDI
LEAVE                                   MOV ECX 8 ; Garbage code. This is NOT allowed, because it alter code.
RETN 4                                  XOR ECX,EBP
MOV EDI,EDI                             POP ESI
                                        LEAVE 
                                        RETN 4
                                        MOV EDI,EDI   

;-------------------------------        ;------------------------------------------
;Original code                          ;Original code after Register substitution
;-------------------------------        ;------------------------------------------
AND DWORD PTR DS:[7228D58C],0           AND DWORD PTR DS:[7228D58C],0
PUSH EAX                                PUSH EBX         ; EAX substitud by EBX
MOV ESI,EAX                             MOV ESI,EBX      ; EAX substitud by EBX
TEST ESI,ESI                            TEST ESI,ESI                                             
MOVZX ESI,SI                            MOVZX ESI,SI  
OR ESI,80070000                         OR ESI,80070000 
MOVZX EAX,WORD PTR DS:[ECX]             MOVZX EBX,WORD PTR DS:[ECX] #
PUSH EAX                                PUSH EBX         ; EAX substitud by EBX 
PUSH ECX                                PUSH ECX
PUSH DWORD PTR DS:[7228D584]            PUSH DWORD PTR DS:[7228D584]
PUSH DWORD PTR DS:[7228D580]            PUSH DWORD PTR DS:[7228D580]
MOV ECX,DWORD PTR SS:[EBP-8]            MOV ECX,DWORD PTR SS:[EBP-8]
MOV EAX,ESI                             MOV EBX,ESI      ; EAX substitud by EBX
POP EDI                                 POP EDI
XOR ECX,EBP                             XOR ECX,EBP
POP ESI                                 POP ESI
LEAVE                                   LEAVE
RETN 4                                  RETN 4
MOV EDI,EDI                             MOV EDI,EDI                                          

While ()
    EAX -------> EVX
    EBX -------> EWX
end


;------------------------------
;Original code                          
;-------------------------------
AND DWORD PTR DS:[7228D58C],0
PUSH EAX
MOV ESI,EAX
TEST ESI,ESI
MOVZX ESI,SI
OR ESI,80070000
MOVZX EAX,WORD PTR DS:[ECX]
PUSH EAX
PUSH ECX
PUSH 2
PUSH DWORD PTR DS:[7228D584]
PUSH DWORD PTR DS:[7228D580]
MOV ECX,DWORD PTR SS:[EBP-8]
MOV EAX,ESI
POP EDI
XOR ECX,EBP
POP ESI
LEAVE
RETN 4
MOV EDI,EDI

;---------------------------------------
;Transposed Code
;---------------------------------------
JMP sec1             ; Jump to section 1
sec3:                ; This is a lable for section 3
MOV ECX,DWORD PTR SS:[EBP-8]
MOV EAX,ESI
POP EDI
XOR ECX,EBP
POP ESI
LEAVE
RETN 4
MOV EDI,EDI
sec1:                ; This is a lable for section 1
AND DWORD PTR DS:[7228D58C],0
PUSH EAX
MOV ESI,EAX
TEST ESI,ESI
MOVZX ESI,SI
JMP sec2             ; Jump to section 2
sec2:                ; This is a lable for section 2
OR ESI,80070000
MOVZX EAX,WORD PTR DS:[ECX]
PUSH EAX
PUSH ECX
PUSH 2
PUSH DWORD PTR DS:[7228D584]
PUSH DWORD PTR DS:[7228D580]
JMP sec3              ; Jump to section 3



; *********************Python script for Substitution of registers*******************

;This is only sudocode for replacement from EAX to EBX. You can develop code for replacement from ECX to EDX. OR from EBX to EDX.
def substitute_registers()

    
    while (from begining of code to end of code)
        Change EAX to ENX  ; EAX ------> ENX 
        Change EBX to EWX  ; EBX ------> EWX

    
    while (from begining of code to end of code)
        Change EWX to EAX  ; EWX ------> EAX 
        Change ENX to EBX  ; ENX ------> EBX

    
;**************************************************************************************



; *************************Python script for Transposed Code***************************

def transposed_code()

    1 - sectionize code into 3 or 4
    2 - lable each section with correct lable (Example: sec1, sec2 etc.)
    3 - use JMP command to conncet each section. (Please see above example)
    
;-----------------------------------------------------


;Python script.
;This is a the body of your python code. it's a loop which traverse evry files 

For (i = 1, i < Number of files, ++i) ;How many files you have
    Open_Original(); You need to open each files
    
    put_Garbagecode(); This function put a garbage code inside files.
    substitute_registers(); for substitue registers
    transposed_code(); for transposing code.
    
    save(); You need to save your metamorphoses code
    


