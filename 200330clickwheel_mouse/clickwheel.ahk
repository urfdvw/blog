#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxHotkeysPerInterval 10000

cx := 0.0
cy := 0.0
rem := 0.0
last_theta := 0.0
w1 := 0.0
w2 := 0.0
w3 := 0.0

atan2(y, x) {
   return dllcall("msvcrt\atan2", "Double", y, "Double", x, "CDECL Double")
}

action() {
    global cx, cy
    global rem, last_theta
    global w1, w2, w3

    pi := 3.1416
    ro := 1.0
    ri := ro
    step := 0.4

    r := Sqrt(cx*cx + cy*cy)
    If (r > ro) {
        cx := cx * ro / r
        cy := cy * ro / r
    }

    theta := atan2(cy, cx)
    dif := theta - last_theta
    last_theta := theta
    If (dif > pi) {
        dif := dif - 2 * pi
    }
    If (dif < -pi) {
        dif := dif + 2 * pi
    }

    w1 := w2
    w2 := w3
    w3 := dif
    dif := (w1 + w2 + w3) / 3.0

    rem := rem + dif
    scroll := Floor(Abs(rem / step))
    if (rem < 0) {
        scroll := -scroll
    }
    rem := rem - step * scroll

    if (r < ri) {
        scroll := 0
    }
    
    Loop, % Abs(scroll)^2 {
        if (scroll > 0) {
            Send, {WheelUp}
        } 
        if (scroll < 0) {
            Send, {WheelDown}
        }
    }
}

WheelUp::
    cy := cy + 1
    action()
    Return
WheelDown::
    cy := cy - 1
    action()
    Return
WheelLeft::
    cx := cx - 1
    action()
    Return
WheelRight::
    cx := cx + 1
    action()
    Return

^WheelUp::Return
^WheelDown::Return