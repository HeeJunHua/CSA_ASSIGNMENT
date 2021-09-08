.MODEL SMALL
.STACK 1500
.386
.DATA
;Login & Register =========================

;Main Menu Data=========================
wlcmMsg db 10,13,"Welcome to our Hotel Reservation System"
        db 10,13,"1.User Profile"
        db 10,13,"2.Room Booking"
        db 10,13,"3.Booking Modification"
        db 10,13,"4.Payment"
        db 10,13,"5.Exit"
        db 10,13,"Please enter your choice: $"
userChoice db ?
;User profile=========================== // User Profile Function
userProfileTitle        db "User Profile"
                        db 10,13, "============"
                        db 10,13, "1. View Profile"
                        db 10,13, "2. Edit Profile"
                        db 10,13, "3. Top Up Balance"
                        db 10,13, "4. Back"
                        db 10,13, "Please Enter Your Choice (1-4): $"

viewProfileTitle        db "View Profile"
                        db 10,13, "============$"

displayName             db "Name: $"
displayPass             db "Password: $"
displayUserBalance      db "Current Balance: $"
displayCreditCardId     db "Credit Card ID: $"
displayBookingTable     db " "

userName                db "Tan Kim Wah"
userPass                db "Abc123abc123-"
userBalance             db "50.00"
userCreditCardID        db "1111 2222 3333 4444"
userBookingHistory      db ?


newName                 label     byte
nameSize                db        30
actName                 db        ?
outputNewName           db        30 dup ("$")
promptNewName           db        10,13, "Please Enter Your New Name: $"  

newPass                 label     byte
passSize                db        30
actPass                 db        ?
outputNewPass           db        30 dup ("$")
promptNewPass           db        10,13, "Please Enter Your New Password (8-30): $"  

addUserCreditCardNo     label     byte
creditCardSize          db        16
actCreditCard           db        ?
outputNewCreditCard     db        16 dup ("$")

saveUserCreditCardID    db ?

displayRinggit db "RM$"

mainMenuChoice db ?

choiceError db "Invalid Choice - Please Enter Between 1-4! $"

;Room Booking===========================
locations       db " 1. Selangor", 13, 10
                db " 2. Kuala Lumpur", 13, 10
                db " 3. Pahang", 13, 10
                db " 4. Penang", 13, 10
                db " 5. Negeri Sembilan", 13, 10
                db " 6. Johor", 13, 10
                db " 7. Perlis", 13, 10
                db " 8. Kelantan", 13, 10
                db " 9. Back to Main Menu", 13, 10
                DB "Please Select a Location :  $"

chosenLocation  db ? ; USER CHOSEN LOCATION, AFTER VALIDATION

promptLengthOfStay    DB "Enter your length of stay : $"

invalidLengthOfStayWarning     db "Invalid Length Of Stay$"

lengthOfStayLabel LABEL BYTE
lengthOfStayMSize       db 4
lengthOfStayASize       db ?
lengthOfStay            db 5 dup(" ")


promptDayOfStay    DB "Enter your day of stay (DD): $" 
invalidDayOfStayWarning     db "Invalid Day Of Stay$"


DayOfStayLabel LABEL BYTE
DayOfStayMSize       db 3
DayOfStayASize       db ?
DayOfStay            db 4 dup(" ")

promptMonthOfStay    DB "Enter your month of stay (MM): $" 
invalidMonthOfStayWarning     db "Invalid month Of Stay$"


monthofStayLabel LABEL BYTE
monthofStayMSize       db 3
monthofStayASize       db ?
monthofStay            db 4 dup(" ")

promptYearOfStay    DB "Enter your year of stay (YYYY): $" 
invalidYearOfStayWarning     db "Invalid year Of Stay$"

yearofStayLabel LABEL BYTE
yearofStayMSize       db 5
yearofStayASize       db ?
yearofStay            db 6 dup(" ")

; available suites
suites          db " 1. Single", 13, 10
                db " 2. Double", 13, 10
                db " 3. Triple", 13, 10
                db " 4. Queen", 13, 10
                db " 5. King", 13, 10
                db " 6. Twin", 13, 10
                db " 7. Double-double", 13, 10
                DB "Please Select Your Desired Suite :  $"

invalidSuite    DB "Please select a proper suite $"
chosenSuite     DB ?

promptNumberOfRooms   db "Enter The Number Of Rooms to Book : $"

numberOfRoomsLabel LABEL BYTE
numberOfRoomsMSize       db 4
numberOfRoomsASize       db ?
numberOfRooms            db 5 dup(" ")

invalidNumberOfRooms    db "Enter a valid Number of rooms$"


promptnumberOfPeople   db "Enter The Number Of People : $"

numberOfPeopleLabel LABEL BYTE
numberOfPeopleMSize       db 4
numberOfPeopleASize       db ?
numberOfPeople            db 5 dup(" ")

invalidnumberOfPeople    db "Enter a valid Number of People$"

; SIZE 16
locationArray           db "Selangor       $"
                        db "Kuala Lumpur   $"
                        db "Pahang         $"
                        db "Penang         $"
                        db "Negeri Sembilan$"
                        db "Johor          $"
                        db "Perlis         $"
                        db "Kelantan       $"

; 14 SIZE
suiteArray              db "Single       $"
                        db "Double       $"
                        db "Triple       $"
                        db "Queen        $"
                        db "King         $"
                        db "Twin         $"
                        db "Double-double$"

confirmLocation         DB "Location            : $"
confirmLengthOfStay     DB "Length Of Stay      : $"
confirmSuite            DB "Suite               : $"
confirmNumberOfRooms    DB "Number Of Rooms     : $"
confirmNumberOfPeople   DB "Number Of People    : $"

;Bookings Modification==================
modifyBooking            db 10,13,"=======BOOKING MODIFICATION======="
                         db 10,13,"1.Edit Bookmark"
                         db 10,13,"2.Room Confirmation"
                         db 10,13,"3.Review Booking History"
                         db 10,13,"4.Back"
                         db 10,13,"Please enter your choice: $"
userBookingSelection     db ?
bookingErrorSelection    db 10,13,"Please enter 1 to 4 only $"



;Payment================================
paymentSub  DB 13,10,"===Payment==="
            DB 13,10,"1.Check out"
            DB 13,10,"2.Check Balance"
            DB 13,10,"3.Payment History"
            DB 13,10,"4.Back $"
paymentSub2 DB 13,10,"1.Back to payment selection."
	    DB 13,10,"2.Back to main menu.$"
paymentStart DB 13,10,"Enter your choice: $"
iresponse  DB 13,10,"Please choose between 1-4 !$"
paymentStr1  DB 13,10,"CHECKOUT PAGE$"
paymentStr2  DB 13,10,"CHECK BALANCE PAGE$"
paymentStr3  DB 13,10,"PAYMENT HISTORY PAGE$"
paymentStr4  DB 13,10,"CURRENT ACCOUNT BALANCE: $"
balance      DB "5000.00 $"
paymentStr5  DB "Do you wish to top up your balance? (y/n) $"
paymentStr6  DB "Do you want to proceed with the payment? (y/n) $"
paymentStr7  DB "Payment Success!  $"


newLine db 10,13,"$"


; ====================

; getDigit's use
digitString DW ?

;Enter to continue
EnterToContinueString db "Enter To Continue$"

.CODE

; LEA SI, STRING
; MOV CL, COUNTER
validateDigits proc
loopDigits:
MOV AL, [SI]
SUB  al,  '0'
mov ah, '9'
sub ah, '0'
CMP  al,  ah
JA   invalid
INC SI
LOOP loopDigits
MOV BL, 01H
ret
invalid:
MOV BL, 00H
ret
validateDigits endp


; PERFORM BELOW ACTION BEFORE CALLING
; LEA SI, ARRAY
printBuffer proc
MOV AH, 09H
MOV DX, SI
ADD DX, 2
INT 21h
ret
printBuffer endp

;PERFORM BELOW ACTION BEFORE CALLING
;LEA SI, ARRAY
getBuffer proc
MOV AH, 0AH

MOV DX, SI
INT 21h

MOV BX, 0000H
MOV BL, [SI + 1]
ADD BL, 2
MOV [SI + BX] , '$'

; PRINT NEWLINE
MOV AH, 09H
LEA DX, newLine
INT 21h

ret
getBuffer endp


clearScreen PROC
mov ah,00
mov al,02
int 10h
ret
clearScreen endp

; LEA DX, STRING 
; BEFORE YOU CALL FUNCTION
printString proc
MOV AH, 09H
INT 21H
ret
printString endp

newLineFunc proc
MOV AH, 09H
LEA DX, NEWlINE
INT 21H
ret
newLineFunc endp

getChar proc
MOV AH, 01H
INT 21H
RET
getChar endp

EnterToContinue proc
LEA DX, EnterToContinueString
call printStringNL
call getChar
ret
EnterToContinue endp

printStringNL proc
call printString
call newLineFunc
ret
printStringNL endp
; assumes it is in AX
; getDigits proc
; MOV 
; MOV SI,  

; getDigits endp

MAIN PROC
MOV AX,@DATA
MOV DS,AX


;-------------------------------------------------------------------MAINMENU START----------------------------------------------------------------------
MAINMENU:
call clearScreen

MOV AH,09H
LEA dx,wlcmMsg
INT 21H

MOV AH,01H
INT 21H
MOV userChoice,AL

MOV AL,userChoice
CMP AL,'1'
JE USERPROFILE
JNE CHOICE2

CHOICE2:
MOV AL,userChoice
CMP AL,'2'
JE ROOMBOOKING
JNE CHOICE3

CHOICE3:
MOV AL,userChoice
CMP AL,'3'
JE BOOKINGMODIFICATION
JNE CHOICE4

CHOICE4:
MOV AL,userChoice
CMP AL,'4'
JE PAYMENT
JNE CHOICE5

CHOICE5:
MOV AL,userChoice
CMP AL,'5'
JE EXIT

;-------------------------------------------------------------------MAINMENU END----------------------------------------------------------------------











;-------------------------------------------------------------------USERPROFILE START----------------------------------------------------------------------

USERPROFILE:; User Profile Function
mov ah,00
mov al,02
int 10h
mov al, 0
MOV AH, 09H
LEA DX,userProfileTitle ; 1. View Profile, 2. Edit Profile, 3. Top Up Balance
INT 21H
mov ah,01H; Input Main Menu Choice
int 21h
CMP al, '1'
JE VIEWPROFILE
JL USERPROFILE_MENUCHOICE_ERROR
CMP al, '2'
JE EDITPROFILE
CMP al, '3'
JE TOPUPBALANCE
CMP al, '4'
JE MAINMENU
JG USERPROFILE_MENUCHOICE_ERROR

VIEWPROFILE:

EDITPROFILE:

TOPUPBALANCE:

USERPROFILE_MENUCHOICE_ERROR:
mov ah, 02H;
mov dl, newLine;
int 21h;
mov ah, 02H;
mov dl, newLine;
int 21h;
mov ah, 09H;
lea dx, choiceError
int 21h;
mov ah,01h
int 21h;
JMP USERPROFILE





;-------------------------------------------------------------------USERPROFILE END----------------------------------------------------------------------












;-------------------------------------------------------------------ROOMBOOKING START----------------------------------------------------------------------
ROOMBOOKING:
; clear screen
call clearScreen

; display locations
LEA DX, LOCATIONS
call printString

; get user input
call getChar
CALL newLineFunc

; validate input
; x => val && x <= val2 trick
; https://stackoverflow.com/questions/5196527/double-condition-checking-in-assembly
SUB  al,  "0"
mov ah, "8"
sub ah, '0'
CMP  al,  ah
JA   ROOMBOOKING
CMP  al,  "9"
JE MAINMENU

; START PROCESSING USER INPUT
MOV CHOSENLOCATION, AL

; =================================================

; lengthOfStayPrompt:
; ; PROMPT FOR LENGTH OF STAY
; LEA DX, promptLengthOfStay
; call printString

; LEA SI, lengthOfStayLabel
; CALL getBuffer
; JMP validateLengthOfStay

; invalidLengthOfStay:
; LEA DX, invalidLengthOfStayWarning
; CALL printStringNL
; CALL EnterToContinue
; JMP lengthOfStayPrompt


; validateLengthOfStay:
; MOV CL, SI[1]
; ADD SI, 2
; call validateDigits
; CMP BL, 00H
; JE invalidLengthOfStay

; ; =================================================

; ; get date of stay
; DayOfStayPrompt:
; ; PROMPT FOR LENGTH OF STAY
; LEA DX, promptDayOfStay
; call printString

; LEA SI, DayOfStayLabel
; CALL getBuffer
; JMP validateDayOfStay

; invalidDayOfStay:
; LEA DX, invalidDayOfStayWarning
; CALL printStringNL
; CALL EnterToContinue
; JMP DayOfStayPrompt

; validateDayOfStay:
; MOV CL, SI[1]
; ADD SI, 2
; call validateDigits
; CMP BL, 00H
; JE invalidDayOfStay

; ; =================================================

; ; get  of stay
; monthOfStayPrompt:
; ; PROMPT FOR LENGTH OF STAY
; LEA DX, promptmonthOfStay
; call printString

; LEA SI, monthOfStayLabel
; CALL getBuffer
; JMP validatemonthOfStay

; invalidmonthOfStay:
; LEA DX, invalidmonthOfStayWarning
; CALL printStringNL
; CALL EnterToContinue
; JMP monthOfStayPrompt

; validatemonthOfStay:
; MOV CL, SI[1]
; ADD SI, 2
; call validateDigits
; CMP BL, 00H
; JE invalidmonthOfStay

; ; =================================================

; yearOfStayPrompt:
; ; PROMPT FOR LENGTH OF STAY
; LEA DX, promptyearOfStay
; call printString

; LEA SI, yearOfStayLabel
; CALL getBuffer
; JMP validateyearOfStay

; invalidyearOfStay:
; LEA DX, invalidyearOfStayWarning
; CALL printStringNL
; CALL EnterToContinue
; JMP yearOfStayPrompt

; validateyearOfStay:
; MOV CL, SI[1]
; ADD SI, 2
; call validateDigits
; CMP BL, 00H
; JE invalidyearOfStay

; ; =================================================
promptSuite:
LEA DX, SUITES
call printString

call getChar
CALL newLineFunc

SUB  al,  "0"
mov chosenSuite, al

mov ah, "8"
sub ah, '0'
CMP  al,  ah
JB   NumberOfRoomsPrompt

LEA DX, invalidSuite
call printStringNL
call EnterToContinue
JMP promptSuite

; ;================================

NumberOfRoomsprompt:
; LEA DX, promptNumberOfRooms
; call printString

; LEA SI, numberOfRoomsLabel
; call getBuffer
; call newLineFunc

; LEA SI, numberOfRoomsLabel
; MOV CL, SI[1]
; ADD SI, 2
; call validateDigits
; CMP BL, 01H
; JE NumberOfPeoplePrompt

; ; if invalid
; LEA DX, invalidNumberOfRooms
; CALL printStringNL
; CALL EnterToContinue
; JMP NumberOfRoomsprompt

; ;=================================

; NumberOfPeoplePrompt:
; LEA DX, promptNumberOfPeople
; call printString

; LEA SI, NumberOfPeopleLabel
; call getBuffer
; call newLineFunc

; LEA SI, NumberOfPeopleLabel
; MOV CL, SI[1]
; ADD SI, 2
; call validateDigits
; CMP BL, 01H
; JE confirmInformation

; ; if invalid
; LEA DX, invalidNumberOfPeople
; CALL printStringNL
; CALL EnterToContinue
; JMP NumberOfPeopleprompt

; ==================================
; Confirm Information
confirmInformation:
CALL clearScreen


; PRINT LOCATION
LEA DX, confirmLocation
call printString


; LEA SI, 
MOV DX, OFFSET locationArray
MOV AL, CHOSENLOCATION
DEC AL
MOV AH, 16
MUL AH
MOV AH, 00H
ADD DX, AX
CALL printStringNL

LEA DX, confirmSuite
call printString

MOV DX, OFFSET suiteArray
MOV AL, chosenSuite
DEC AL
MOV AH, 14
MUL AH
MOV AH, 00H
ADD DX, AX
CALL printStringNL

call EnterToContinue






JMP ROOMBOOKING




;-------------------------------------------------------------------ROOMBOOKING END----------------------------------------------------------------------









;-------------------------------------------------------------------BOOKINGMODIFY START----------------------------------------------------------------------
BOOKINGMODIFICATION:
JMP MAINMENU

;-------------------------------------------------------------------BOOKINGMODIFY END----------------------------------------------------------------------












;-------------------------------------------------------------------PAYMENT START----------------------------------------------------------------------
PAYMENT:
;----OUTPUT PAYMENT SUBMENU
MOV AH, 09H
LEA DX, paymentSub
INT 21H

PROMPT:
;----PROMPT MESSAGE
MOV AH, 09H
LEA DX, paymentStart
INT 21H

;---INPUT USER CHOICE (01H)
MOV AH, 01H
INT 21H

MOV AH, 09H
LEA DX, newLine
INT 21H

CMP AL, "1"
JE CHKOUT
CMP AL, "2"
JE CHKBLC
CMP AL, "3"
JE PAYHISTORY

MOV AH, 09H
LEA DX, iresponse
INT 21H
JMP PROMPT




CHKOUT:
MOV AH, 09H
LEA DX, paymentStr1
INT 21H
JMP EXIT


CHKBLC:
MOV AH, 09H
LEA DX, paymentStr2
INT 21H

;----OUTPUT CURRENT ACCOUNT BALANCE
MOV AH, 09
LEA DX, paymentStr4
INT 21H
MOV AH, 09H
LEA DX, balance
INT 21H


MOV AH, 09H
LEA DX, newLine
INT 21H


;----PROMPT USER TO CONTINUE





JMP EXIT



PAYHISTORY:
JMP EXIT
;-------------------------------------------------------------------PAYMENT END------------------------------------------------------------------------




EXIT:
MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN
