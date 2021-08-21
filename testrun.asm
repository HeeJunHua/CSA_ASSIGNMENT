
.MODEL SMALL
.STACK 1500
.DATA
;For relative jump out of range
.386
;Bookings Modification===========================================================================
modifyBooking           db 10,13,"=======BOOKING MODIFICATION======="
                        db 10,13,"1.Edit Bookmark"
                        db 10,13,"2.Room Confirmation"
                        db 10,13,"3.Review Booking History"
                        db 10,13,"4.Back"
                        db 10,13,"Please enter your choice: $"
userBookingSelection    db ?
bookingErrorSelection   db 10,13,"Please enter valid selection only !!! $"
;Bookings Modification===========================================================================
;================================================================================================Selection 1
editBookingBookmark     db 10,13,"Below are saved bookmarks from user: $"
boorkmarkSuccess        db 10,13,"Successfully Updated Bookmark $"
;================================================================================================Selection 1
;================================================================================================Selection 2
confirmBooking          db 10,13,"Please choose you selection"
                        db 10,13,"1.Edit Booking Details"
                        db 10,13,"2.Cancel Booking"
                        db 10,13,"Please enter your choice: $"
cancelBookingMsg        db 10,13,"Successfully cancelled and deleted booking $"
editBookingMsg          db 10,13,"Successfully edited booking $"
confirmBookingSelection db ?
;================================================================================================Selection 2
;================================================================================================Selection 3
displayBookingHistory   db 10,13,"Below are user's booking history $"
;================================================================================================Selection 3
;================================================================================================Proceed Or Stop Choice
proceedOrStopMsg        db 10,13,"Do you wish to continue ?"
                        db 10,13,"1.Proceed to payment"
                        db 10,13,"2.Back to room booking"
                        db 10,13,"Please enter your choice : $"
continueOrStop          db ?
;================================================================================================Proceed Or Stop Choice
newLine db 10,13,"$"


.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX

;=======================================================================================
BOOKINGMODIFICATION:
MOV AH,09H
LEA DX,modifyBooking
INT 21H

MOV AH,01H
INT 21H
MOV userBookingSelection,AL

MOV AL,userBookingSelection
CMP AL,'1'
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H
JE BOOKINGSELECT1
JL BOOKINGSELECTIONERRORMSG

MOV AL,userBookingSelection
CMP AL,'2'
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H
JE BOOKINGSELECT2

MOV AL,userBookingSelection
CMP AL,'3'
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H
JE BOOKINGSELECT3

MOV AL,userBookingSelection
CMP AL,'4'
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H
JG BOOKINGSELECTIONERRORMSG
JE EXIT ;MAINMENU remember to change !!!


;=======================================================================================BOOKING SELECT 1
BOOKINGSELECT1:
;=============================================================================EDIT BOOKMARK
MOV AH,09H
LEA DX,boorkmarkSuccess
INT 21H
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H
JMP PROCEEDORSTOPBOOKINGCONFIGURATION
;=======================================================================================BOOKING SELECT 2
BOOKINGSELECT2:
MOV AH,09H
LEA DX,confirmBooking
INT 21H

MOV AH,01H
INT 21H
MOV confirmBookingSelection,AL
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H

MOV AL,confirmBookingSelection
CMP AL,'1'
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H
JE BOOKINGCONFIRMATIONSELECTION1
JL BOOKINGCONFIRMATIONRRORMSG

MOV AL,confirmBookingSelection
CMP AL,'2'
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H
JE BOOKINGCONFIRMATIONSELECTION2
JG BOOKINGCONFIRMATIONRRORMSG

BOOKINGCONFIRMATIONRRORMSG:
MOV AH,09H
LEA DX,bookingErrorSelection
INT 21H
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H
JMP BOOKINGSELECT2

BOOKINGCONFIRMATIONSELECTION1:
;=============================================================================EDIT BOOKING
MOV AH,09H
LEA DX,editBookingMsg
INT 21H
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H
JMP PROCEEDORSTOPBOOKINGCONFIGURATION

BOOKINGCONFIRMATIONSELECTION2:
;=============================================================================DELETE BOOKING
MOV AH,09H
LEA DX,cancelBookingMsg
INT 21H
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H
JMP PROCEEDORSTOPBOOKINGCONFIGURATION

;====================================================================================================PROCEED OR STOP BOOKING
PROCEEDORSTOPBOOKINGCONFIGURATION:
MOV AH,09H
LEA DX,proceedOrStopMsg
INT 21H

MOV AH,01H
INT 21H
MOV continueOrStop,AL

MOV AL,continueOrStop
CMP AL,'1'
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H
JE PAYMENT
JL PROCEEDORSTOPERRORMSG

MOV AL,continueOrStop 
CMP AL,'2'
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H
JE BOOKINGMODIFICATION
JG PROCEEDORSTOPERRORMSG

PROCEEDORSTOPERRORMSG:
MOV AH,09H
LEA DX,bookingErrorSelection
INT 21H
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H
JMP PROCEEDORSTOPBOOKINGCONFIGURATION

;=======================================================================================BOOKING SELECT 3
BOOKINGSELECT3:
;=============================================================================DISPLAY BOOKING HISTORY
MOV AH,09H
LEA DX,displayBookingHistory
INT 21H
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H
JMP PROCEEDORSTOPBOOKINGCONFIGURATION
;=======================================================================================BOOKING SELECT 4
BOOKINGSELECTIONERRORMSG:
MOV AX,0600H
MOV BH,71H
MOV CX,0000H
MOV DX,184FH
INT 10H
MOV AH,09H
LEA DX,bookingErrorSelection
INT 21H
mov ah,02H;===========================newline
mov dl,newLine; print new line
int 21H
JMP BOOKINGMODIFICATION


USERPROFILE:
JMP EXIT
PAYMENT:
JMP EXIT
ROOMBOOKING:
JMP EXIT
;=======================================================================================
EXIT:
MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN