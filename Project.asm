.MODEL SMALL
.STACK 100H

;------------------------------------
; 1. Initialization               
;-------------------------------------


.DATA 
   
northwest DW "NORTH-WEST: $"
southeast DW "SOUTH-EAST: $"
eastnorth DW "EAST-NORTH: $" 
westsouth DW "WEST-SOUTH: $" 

GREEN DW "GREEN $"
YELLOW DW "YELLOW $"
RED DW "RED $"

INPUT1 DW "PLEASE SELECT A DIRECTION TO FOR THE STATE GREEN: $"
INPUT2 DW "FOR NORTH-WEST, TYPE 1 $"
INPUT3 DW "FOR SOUTH-EAST, TYPE 2 $"
INPUT4 DW "FOR EAST-NORTH, TYPE 3 $"
INPUT5 DW "FOR WEST-SOUTH, TYPE 4 $"

WRONG DW "WRONG INPUT, TRY AGAIN$"  



lightStateGreen dw "Green$"
lightStateYellow dw "Yellow$"
lightStateRed dw "Red$"

redColor dw "All lights are red.$"
greenColor dw "All lights are green.$"


currentLightMessage db "Current Light Status: $"
currentLight db 0 

delay dw "DELAY $"
other dw "Please press either 0 or 2 for manual overwritting:  $"


feat1 dw "1.Implementing the traffic lights$"
feat2 dw "2.Displaying the current light status$"
feat3 dw "3.Timed Light Cycles of traffic lights$"
feat4 dw "4.Manual Overwrite for Pedastrians$"



.CODE

MAIN PROC
    MOV AX, @DATA       ; Initialize data segment
    MOV DS, AX
    
    
;------------------------------------
; 1. Implementing the traffic lights               
;------------------------------------- 

    MOV AH,9
    LEA DX,feat1
    INT 21H
    
    CALL CarriageLine
    
    LEA DX, INPUT1  
    MOV AH, 09H       
    INT 21H
    
    MOV AH,2      ;NEW LINE
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H  
    
    LEA DX, INPUT2 
    MOV AH, 09H       
    INT 21H
    
    MOV AH,2      ;NEW LINE
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H 
    
    LEA DX, INPUT3  
    MOV AH, 09H       
    INT 21H
    
    MOV AH,2      ;NEW LINE
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H 
    
    LEA DX, INPUT4 
    MOV AH, 09H       
    INT 21H
    
    MOV AH,2      ;NEW LINE
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H 
    
    LEA DX, INPUT5  
    MOV AH, 09H       
    INT 21H
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H
    
    
   
    
    ;taking input
    
    START:   
    
    MOV AH, 1 
    INT 21H
    MOV BL, AL 
    
    CMP BL, 31H
    JE NW
        
    CMP BL, 32H
    JE SE
    
    CMP BL, 33H
    JE EN
    
    CMP BL, 34H
    JE WS 
    
    LEA DX, INPUT5  
    MOV AH, 09H       
    INT 21H
    
    JMP START
    
    
;------------------------------------
; 2.Displaying the current light status              
;-------------------------------------
    
    MOV AH,9
    LEA DX,feat2
    INT 21H
    
    CALL CarriageLine
  
    
    NW:
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H



    LEA DX, northwest   
    MOV AH, 09H         
    INT 21H          
    LEA DX, GREEN   
    MOV AH, 09H        
    INT 21H
           
           
    MOV AH,2      ;NEW LINE
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H

                    

    LEA DX, southeast     
    MOV AH, 09H        
    INT 21H   
    LEA DX, YELLOW  
    MOV AH, 09H       
    INT 21H
    
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H            


  
    LEA DX, eastnorth   
    MOV AH, 09H        
    INT 21H     
    LEA DX, RED   
    MOV AH, 09H        
    INT 21H
      
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H            


    LEA DX, westsouth       
    MOV AH, 09H       
    INT 21H                                     
    LEA DX, RED   
    MOV AH, 09H        
    INT 21H
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H
    
    JMP Feature3
    
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
    MOV AH,9
    LEA DX,feat2
    INT 21H
    
    CALL CarriageLine
    
    SE:
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H



    LEA DX, northwest   
    MOV AH, 09H         
    INT 21H          
    LEA DX, RED   
    MOV AH, 09H        
    INT 21H
           
           
    MOV AH,2      ;NEW LINE
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H

                    

    LEA DX, southeast     
    MOV AH, 09H        
    INT 21H   
    LEA DX, GREEN  
    MOV AH, 09H       
    INT 21H
    
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H            


  
    LEA DX, eastnorth   
    MOV AH, 09H        
    INT 21H     
    LEA DX, YELLOW   
    MOV AH, 09H        
    INT 21H
      
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H            


    LEA DX, westsouth       
    MOV AH, 09H       
    INT 21H                                     
    LEA DX, RED   
    MOV AH, 09H        
    INT 21H
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H
    
    JMP Feature3
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
    MOV AH,9
    LEA DX,feat2
    INT 21H
    
    CALL CarriageLine
    
    
    EN:
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H



    LEA DX, northwest   
    MOV AH, 09H         
    INT 21H          
    LEA DX, RED   
    MOV AH, 09H        
    INT 21H
           
           
    MOV AH,2      ;NEW LINE
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H

                    

    LEA DX, southeast     
    MOV AH, 09H        
    INT 21H   
    LEA DX, RED  
    MOV AH, 09H       
    INT 21H
    
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H            


  
    LEA DX, eastnorth   
    MOV AH, 09H        
    INT 21H     
    LEA DX, GREEN   
    MOV AH, 09H        
    INT 21H
      
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H            


    LEA DX, westsouth       
    MOV AH, 09H       
    INT 21H                                     
    LEA DX, YELLOW   
    MOV AH, 09H        
    INT 21H
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H 
    
    JMP Feature3
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
    MOV AH,9
    LEA DX,feat2
    INT 21H
    
    CALL CarriageLine    
    
    WS:
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H



    LEA DX, northwest   
    MOV AH, 09H         
    INT 21H          
    LEA DX, YELLOW   
    MOV AH, 09H        
    INT 21H
           
           
    MOV AH,2      ;NEW LINE
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H

                    

    LEA DX, southeast     
    MOV AH, 09H        
    INT 21H   
    LEA DX, RED  
    MOV AH, 09H       
    INT 21H
    
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H            


  
    LEA DX, eastnorth   
    MOV AH, 09H        
    INT 21H     
    LEA DX, RED   
    MOV AH, 09H        
    INT 21H
      
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H            


    LEA DX, westsouth       
    MOV AH, 09H       
    INT 21H                                     
    LEA DX, GREEN   
    MOV AH, 09H        
    INT 21H
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H  
    
    
    
   JMP Feature3
    
 
;------------------------------------
; 3. Timed Light Cycles               
;-------------------------------------

Feature3:

CALL CarriageLine

MOV AH,9
LEA DX, feat3
INT 21H

CALL CarriageLine


MOV CX, 10
Green1:                               ;GREEN LIGHT STAYS ON FOR 10 SECS  
    MOV currentLight, 0
    CALL DisplayCurrentLightStatus
    
    MOV AH,9
    LEA DX,lightStateGreen
    INT 21H
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H
     
    CALL delayStatus
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H
    
LOOP Green1

CALL CarriageLine
        

MOV CX, 5
Yellow1:                              ;YELLOW LIGHT STAYS ON FOR 5 SECS

    MOV currentLight, 1
    CALL DisplayCurrentLightStatus
    
    MOV AH,9
    LEA DX,lightStateYellow
    INT 21H
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H
     
    CALL delayStatus
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H
    
LOOP Yellow1

CALL CarriageLine


MOV CX, 10
MOV DX, 30H                                     ;RED LIGHT STAYS ON FOR 10 SECS
Red1:
    MOV currentLight, 2
    CALL DisplayCurrentLightStatus
    
    MOV AH,9
    LEA DX,lightStateRed
    INT 21H
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H
     
    CALL delayStatus
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H
    
LOOP Red1

JMP Feature4
       
    
; ------------------------------------
; 3. Manual Overwrite for Pedastrians
; ------------------------------------ 

Feature4:

CALL CarriageLine


MOV AH,9
LEA DX, feat4
INT 21H

MOV AH,2
MOV DX,0DH
INT 21H
MOV DX, 0AH
INT 21H


MOV BL, 32H
MOV CL, 30H

START1:

    MOV AH,1
    INT 21H
    
    CMP AL,BL     ;2 FOR RED, 2-->HEXA-->32H
    JE TurnAllLightsRed

    CMP AL,CL     ;0 FOR GREEN, 0-->HEXA-->30H
    JE TurnAllLightsGreen
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H
    
    
    MOV AH,9
    LEA DX, other
    INT 21H
    
    JMP START1
      
        
    TurnAllLightsRed:
        MOV currentLight, 2
            
        MOV AH,2
        MOV DX,0DH
        INT 21H
        MOV DX, 0AH
        INT 21H                       
        
        CALL DisplayCurrentLightStatus
            
        MOV AH,9
        LEA DX, redColor
        INT 21H
        
        JMP EXIT
    
    
    TurnAllLightsGreen:
        MOV currentLight, 0
            
        MOV AH,2
        MOV DX,0DH
        INT 21H
        MOV DX, 0AH
        INT 21H
        
        CALL DisplayCurrentLightStatus
            
        MOV AH,9
        LEA DX, greenColor
        INT 21H
        
        JMP EXIT
    

CarriageLine:
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H
    
    MOV AH,2
    MOV DX,0DH
    INT 21H
    MOV DX, 0AH
    INT 21H
    
    Ret


   

; ------------------------------------
; Display Current Light Status
; ------------------------------------ 


DisplayCurrentLightStatus:
    MOV AH,9
    LEA DX, currentLightMessage
    INT 21H 
    
    Ret 


; ------------------------------------
; Delay
; ------------------------------------

delayStatus:
    MOV AH,9
    LEA DX, delay
    INT 21H
    
    Ret
    
 



 
EXIT:

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN    


