################################################################################
# NSIS Script : Packaging.nsi
# (C) 2020 HSMR. All rights reserved.
#-------------------------------------------------------------------------------
# - OS : Windows
# - Silent Install : setup.exe /s
# - Silent UnInstall : uninst.exe /s
################################################################################
!define PRODUCT_MAIN "HSMR"
!define PRODUCT_NAME "Dad Calculator"
!define PRODUCT_COMPANY "HSMR"
!define PRODUCT_VERSION "1.0.0.1"
!define PRODUCT_BUILD_NO "b20191217"
!define PRODUCT_PUBLISHER "HSMR"
!define PRODUCT_WEB_SITE "https://sample.com"
!define PRODUCT_EXE "°è»ê±â.exe"
!define PRODUCT_ICO "Calculator.ico"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\${PRODUCT_EXE}"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKCU"
!define VER_MAJOR 1
!define VER_MINOR 3
!define UNINST_PNAME "uninst.exe"
!define RELEASE_NAME "Release"
!define OUTPUT_NAME "setup_dadcalculator"
!define SHCNE_ASSOCCHANGED 0x08000000
!define SHCNF_IDLIST 0

; Unicode true
SetCompressor lzma

; MUI 1.67 compatible ----------------------------------------------------------
!include "MUI.nsh"
!include "Library.nsh"
;!include "TextFunc.nsh"
;!include "WordFunc.nsh"
;!include "WinMessages.nsh"
;!include "FileFunc.nsh"
;!insertmacro Locate
;!insertmacro ConfigWrite
;!insertmacro LineRead
;!insertmacro WordReplace

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\orange-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\orange-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "${NSISDIR}\License\license.txt"
; Instfiles page
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\${PRODUCT_EXE}"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"
;!insertmacro MUI_LANGUAGE "Korean"
;!insertmacro MUI_LANGUAGE "Japanese"

; Reserve files
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS
; MUI end ----------------------------------------------------------------------

Name "${PRODUCT_MAIN} ${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile ".\${OUTPUT_NAME}_v${PRODUCT_VERSION}_${PRODUCT_BUILD_NO}_${__DATE__}.exe"
InstallDir "$PROGRAMFILES\${PRODUCT_MAIN}\${PRODUCT_NAME}"
RequestExecutionLevel admin
ShowInstDetails show
ShowUnInstDetails show
SilentInstall normal
SilentUnInstall normal
;AutoCloseWindow true
;WindowIcon on
;Icon "${NSISDIR}\Contrib\Graphics\Icons\nsis1-install.ico"
;UninstallIcon "${NSISDIR}\Contrib\Graphics\Icons\nsis1-uninstall.ico"

Function .onInit
    ; Check windows version... Can't install windows 95/98/Me.
    Call GetWindowsVersion
    Pop $R0
    StrCmp $R0 '95' 0 +2             ; not windows 95 +1
    Goto +7
    StrCmp $R0 '98' 0 +2              ; not windows 98 +1
    Goto +5
    StrCmp $R0 '98 SE' 0 +2           ; not windows 98 SE +1
    Goto +3
    StrCmp $R0 'ME' 0 +1              ; not windows ME +1
    Goto +3
    MessageBox MB_OK "Can't install ${PRODUCT_NAME} to Windows 95/98/Me OS!"
    Quit
    
    ; Check silent insall
    Call GetParameters
    Pop $0
    
    StrCmp $0 "/s" 0 +3
    SetSilent silent
    Goto +2
    SetSilent normal
    SetAutoClose true
FunctionEnd

Section "Main Section" SEC01
    ;ExecShell "open" "$INSTDIR\${BATCH_PNAME}" "-k" SW_HIDE
    ;Sleep 2000
    ;ExecWait '"$INSTDIR\${BATCH_PNAME}" -k'
    ;ExecWait '"$INSTDIR\${ONLINE_PNAME}" -k'
    ;ExecWait '"NET.EXE" STOP ${ONLINE_SERVICE_NAME}'
    ;ExecWait '"NET.EXE" STOP ${BATCH_SERVICE_NAME}'
    KillProcDLL::KillProc "${PRODUCT_EXE}"
    ;Processes::KillProcess "${PRODUCT_EXE}"
    
    SetOutPath "$INSTDIR"
    CreateDirectory "$INSTDIR"
    SetOverwrite on
    File ..\bin\${RELEASE_NAME}\${PRODUCT_EXE}
    File ..\bin\${RELEASE_NAME}\${PRODUCT_ICO}
    File ..\Readme.md
    File ..\License.md
    ;SetOverwrite off
    ;File ..\bin\${RELEASE_NAME}\Newtonsoft.Json.dll
    ;SetOverwrite on
    
    SetOutPath "$INSTDIR\Images"
    CreateDirectory "$INSTDIR\Images"
    File /r ..\Images\*.*
    
    SetOutPath "$INSTDIR\ko"
    CreateDirectory "$INSTDIR\ko"
    File /r ..\bin\${RELEASE_NAME}\ko\*.*

    ;SetOutPath "$INSTDIR\en"
    ;CreateDirectory "$INSTDIR\en"
    ;File /r ..\bin\${RELEASE_NAME}\en\*.*

    SetOutPath "$INSTDIR\ja"
    CreateDirectory "$INSTDIR\ja"
    File /r ..\bin\${RELEASE_NAME}\ja\*.*

    SetOutPath "$INSTDIR\zh"
    CreateDirectory "$INSTDIR\zh"
    File /r ..\bin\${RELEASE_NAME}\zh\*.*
    
    SetOutPath $INSTDIR
    
    ;${ConfigWrite} "$INSTDIR\posbod.ini" "InstallType=" "Master" $R0
    ;${ConfigWrite} "$INSTDIR\php.ini" "zend_extension_ts = " "$\"$INSTDIR\Apache2\ZendOptimizer\ZendExtensionManager.dll$\"" $R0
    ;${ConfigWrite} "$INSTDIR\php.ini" "zend_extension_manager.optimizer_ts = " "$\"$INSTDIR\Apache2\ZendOptimizer\Optimizer-3.2.2$\"" $R0
SectionEnd

Section "Second Section" Second

SectionEnd

Section -AdditionalIcons
    ; Remove shortcut
    ;SetShellVarContext current
    ;RMDir /r "$SMPROGRAMS\${PRODUCT_MAIN} ${PRODUCT_NAME}"
    ;Delete "$DESKTOP\${PRODUCT_NAME}.lnk"
    SetShellVarContext all
    RMDir /r "$SMPROGRAMS\${PRODUCT_MAIN} ${PRODUCT_NAME}"
    Delete "$DESKTOP\${PRODUCT_NAME}.lnk"
    
    Call RefreshShellIcons
    
    ; Be sure to change the starting position so that when creating a Shortcut, the starting position is maintained.
    SetOutPath "$INSTDIR"
    
    ; Start Menu shortcuts
    CreateDirectory "$SMPROGRAMS\${PRODUCT_MAIN} ${PRODUCT_NAME}"
    CreateShortCut "$SMPROGRAMS\${PRODUCT_MAIN} ${PRODUCT_NAME}\${PRODUCT_NAME}.lnk" "$INSTDIR\${PRODUCT_EXE}" "" "$INSTDIR\${PRODUCT_ICO}"
    ;CreateShortCut "$SMPROGRAMS\${PRODUCT_MAIN} ${PRODUCT_NAME}\${PRODUCT_NAME} User Manual.lnk" "$INSTDIR\Help\IIPManager User Manual.xps"
    CreateShortCut "$SMPROGRAMS\${PRODUCT_MAIN} ${PRODUCT_NAME}\Uninstall ${PRODUCT_NAME}.lnk" "$INSTDIR\${UNINST_PNAME}"
    
    ;CreateShortCut "$SMPROGRAMS\${PRODUCT_MAIN} ${PRODUCT_NAME}\Start ${PRODUCT_NAME} Online Service.lnk" "$INSTDIR\${ONLINE_PNAME}" \
    ;"-s" "$INSTDIR\${ONLINE_PNAME}" 0 SW_SHOWNORMAL \
    ;"Shortcut Key" "Description Start ${PRODUCT_NAME} Online Service"
    
    ;CreateShortCut "$SMPROGRAMS\${PRODUCT_MAIN} ${PRODUCT_NAME}\Uninstall ${PRODUCT_NAME}.lnk" "$INSTDIR\${UNINST_PNAME}" \
    ;"" "$INSTDIR\${UNINST_PNAME}" 0 SW_SHOWNORMAL \
    ;"" "Uninstall ${PRODUCT_NAME}"
    
    ; Desktop shortcuts
    CreateShortCut "$DESKTOP\${PRODUCT_NAME}.lnk" "$INSTDIR\${PRODUCT_EXE}" "" "$INSTDIR\${PRODUCT_ICO}"
    
    Call RefreshShellIcons
SectionEnd

Section -Post
    ; Write registry component
    ;RegDLL "$INSTDIR\MBPrgBar.ocx"
    ; Add Windows Service Online/Batch service
    ;ExecWait '"$INSTDIR\${BATCH_PNAME}" -i'
    ;Sleep 1000
    ;ExecWait '"NET.EXE" START ${ONLINE_SERVICE_NAME}'
    ;Sleep 2000
    ;ExecWait '"NET.EXE" START ${BATCH_SERVICE_NAME}'
    ; Registration of startup program
    ;WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Run" "${PRODUCT_NAME}" "$INSTDIR\${PRODUCT_EXE} --hide"
    ; Write uninstall information
    WriteUninstaller "$INSTDIR\${UNINST_PNAME}"
    WriteRegStr HKCU "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\${PRODUCT_EXE}"
    WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "${PRODUCT_MAIN} ${PRODUCT_NAME}"
    WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\${UNINST_PNAME}"
    WriteRegExpandStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "InstallLocation" "$INSTDIR"
    WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\${PRODUCT_EXE},0"
    WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
    WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
    WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
    WriteRegDWORD ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "VersionMajor" "${VER_MAJOR}"
    WriteRegDWORD ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "VersionMinor" "${VER_MINOR}"
    WriteRegDWORD ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "EstimatedSize" "235"
    WriteRegDWORD ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "NoModify" "1"
    WriteRegDWORD ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "NoRepair" "1"
SectionEnd

Function un.onInit
    ; Check silent install
   	Push $R0
   	Push $R1
   	Push $R2
   	Push $R3

   	StrCpy $R2 1
   	StrLen $R3 $CMDLINE

   	; Check for quote or space
   	StrCpy $R0 $CMDLINE $R2
   	StrCmp $R0 '"' 0 +3
        StrCpy $R1 '"'
     	Goto loop
   	StrCpy $R1 " "
    
    loop:
        IntOp $R2 $R2 + 1
     	StrCpy $R0 $CMDLINE 1 $R2
     	StrCmp $R0 $R1 get
     	StrCmp $R2 $R3 get
     	Goto loop

    get:
     	IntOp $R2 $R2 + 1
     	StrCpy $R0 $CMDLINE 1 $R2
     	StrCmp $R0 " " get
     	StrCpy $R0 $CMDLINE "" $R2

       	Pop $R3
       	Pop $R2
       	Pop $R1
       	Exch $R0
    
    	;Call GetParameters
    
    	Pop $0
    	StrCmp $0 "/s" 0 +3
    	SetSilent silent
    	Goto +4
    	SetSilent normal
    	MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Uninstall ${PRODUCT_MAIN} ${PRODUCT_NAME}?" IDYES NoAbort
        Abort ; causes uninstaller to quit.
    NoAbort:
FunctionEnd

Section Uninstall
    ;ExecWait '"$INSTDIR\${BATCH_PNAME}" -k'
    ;ExecWait '"NET.EXE" STOP ${ONLINE_SERVICE_NAME}'
    KillProcDLL::KillProc "${PRODUCT_EXE}"
    ;Processes::KillProcess "${PRODUCT_EXE}"
    Sleep 3000
    
    ;UnRegDLL "$INSTDIR\MpowerCopyHook.dll"
    ;UnRegDLL "$SYSDIR\COMDLG32.OCX"
    
    ;Delete "$INSTDIR\*.*"
    ;RMDir /r "$INSTDIR\conf"
    RMDir /r "$INSTDIR"
    
    ; Delete Windows Vista/7 virtual directory
    ;RMDir /r "$LOCALAPPDATA\VirtualStore\Program Files\MOCOCO\Mpower"
    
    ; Remove shortcut
    ;SetShellVarContext current
    ;RMDir /r "$SMPROGRAMS\${PRODUCT_MAIN} ${PRODUCT_NAME}"
    ;Delete "$DESKTOP\${PRODUCT_NAME}.lnk"
    SetShellVarContext all
    RMDir /r "$SMPROGRAMS\${PRODUCT_MAIN} ${PRODUCT_NAME}"
    Delete "$DESKTOP\${PRODUCT_NAME}.lnk"
    
    ;Call RefreshShellIcons
    
    ; Delete registry information
    DeleteRegKey HKCU "Software\${PRODUCT_COMPANY}\${PRODUCT_NAME}"
    DeleteRegValue HKCU "Software\Microsoft\Windows\CurrentVersion\Run" "${PRODUCT_NAME}"
    DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
    DeleteRegKey HKCU "${PRODUCT_DIR_REGKEY}"
    SetAutoClose true
SectionEnd

Function un.onUninstSuccess
    HideWindow
    IfSilent +2
    MessageBox MB_ICONINFORMATION|MB_OK "Uninstalled ${PRODUCT_MAIN} ${PRODUCT_NAME}"
FunctionEnd

/*---------------------------------------------------------------
	GetParameters
 	input, none
 	output, top of stack (replaces, with e.g. whatever)
 	modifies no other variables.
---------------------------------------------------------------*/
Function GetParameters
   	Push $R0
   	Push $R1
   	Push $R2
   	Push $R3

   	StrCpy $R2 1
   	StrLen $R3 $CMDLINE

   	;Check for quote or space
   	StrCpy $R0 $CMDLINE $R2
   	StrCmp $R0 '"' 0 +3
     		StrCpy $R1 '"'
     		Goto loop
   	StrCpy $R1 " "

   loop:
     	IntOp $R2 $R2 + 1
     	StrCpy $R0 $CMDLINE 1 $R2
     	StrCmp $R0 $R1 get
     	StrCmp $R2 $R3 get
     	Goto loop

   get:
     	IntOp $R2 $R2 + 1
     	StrCpy $R0 $CMDLINE 1 $R2
     	StrCmp $R0 " " get
     	StrCpy $R0 $CMDLINE "" $R2

   	Pop $R3
   	Pop $R2
   	Pop $R1
   	Exch $R0
FunctionEnd

; StrStr
; input, top of stack = string to search for
;        top of stack-1 = string to search in
; output, top of stack (replaces with the portion of the string remaining)
; modifies no other variables.
;
; Usage:
;   Push "this is a long ass string"
;   Push "ass"
;   Call StrStr
;   Pop $R0
;  ($R0 at this point is "ass string")

Function StrStr
    Exch $R1 ; st=haystack,old$R1, $R1=needle
    Exch    ; st=old$R1,haystack
    Exch $R2 ; st=old$R1,old$R2, $R2=haystack
    Push $R3
    Push $R4
    Push $R5
    StrLen $R3 $R1
    StrCpy $R4 0
    ; $R1=needle
    ; $R2=haystack
    ; $R3=len(needle)
    ; $R4=cnt
    ; $R5=tmp
    loop:
        StrCpy $R5 $R2 $R3 $R4
        StrCmp $R5 $R1 done
        StrCmp $R5 "" done
        IntOp $R4 $R4 + 1
        Goto loop
    done:
        StrCpy $R1 $R2 "" $R4
        Pop $R5
        Pop $R4
        Pop $R3
        Pop $R2
        Exch $R1
FunctionEnd

; GetWindowsVersion
;
; Based on Yazno's function, http://yazno.tripod.com/powerpimpit/
; Updated by Joost Verburg
;
; Returns on top of stack
;
; Windows Version (95, 98, ME, NT x.x, 2000, XP, 2003, Vista)
; or
; '' (Unknown Windows Version)
;
; Usage:
;   Call GetWindowsVersion
;   Pop $R0
;   ; at this point $R0 is "NT 4.0" or whatnot

Function GetWindowsVersion
    Push $R0
    Push $R1

    ClearErrors

    ReadRegStr $R0 HKLM \
        "SOFTWARE\Microsoft\Windows NT\CurrentVersion" CurrentVersion

    IfErrors 0 lbl_winnt

    ; we are not NT
    ReadRegStr $R0 HKLM \
        "SOFTWARE\Microsoft\Windows\CurrentVersion" VersionNumber

    StrCpy $R1 $R0 1
    StrCmp $R1 '4' 0 lbl_error

    StrCpy $R1 $R0 3

    StrCmp $R1 '4.0' lbl_win32_95
    StrCmp $R1 '4.9' lbl_win32_ME lbl_win32_98

    lbl_win32_95:
        StrCpy $R0 '95'
        Goto lbl_done

    lbl_win32_98:
        ;StrCpy $R0 '98'
        ;Goto lbl_done
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;beginning of additions to support win 98 SE
    push $R0
    push "."
    call StrStr
    pop $R0
    StrCpy $R0 $R0 "" 1
    StrCmp $R0 "10.2222" lbl_win32_98SE
    StrCpy $R0 '98'  ;;this line was not added
    Goto lbl_done      ;;this line was not added either

    lbl_win32_98SE:
        StrCpy $R0 '98 SE'
        Goto lbl_done
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    lbl_win32_ME:
        StrCpy $R0 'ME'
        Goto lbl_done

    lbl_winnt:

    StrCpy $R1 $R0 1

    StrCmp $R1 '3' lbl_winnt_x
    StrCmp $R1 '4' lbl_winnt_x

    StrCpy $R1 $R0 3

    StrCmp $R1 '5.0' lbl_winnt_2000
    StrCmp $R1 '5.1' lbl_winnt_XP
    StrCmp $R1 '5.2' lbl_winnt_2003
    StrCmp $R1 '6.0' lbl_winnt_vista lbl_error

    lbl_winnt_x:
        StrCpy $R0 "NT $R0" 6
        Goto lbl_done

    lbl_winnt_2000:
        Strcpy $R0 '2000'
        Goto lbl_done

    lbl_winnt_XP:
        Strcpy $R0 'XP'
        Goto lbl_done

    lbl_winnt_2003:
        Strcpy $R0 '2003'
        Goto lbl_done

    lbl_winnt_vista:
        Strcpy $R0 'Vista'
        Goto lbl_done

    lbl_error:
        Strcpy $R0 ''
        lbl_done:

    Pop $R1
    Exch $R0
FunctionEnd

Function RefreshShellIcons
    ; By jerome tremblay - april 2003
    System::Call 'shell32.dll::SHChangeNotify(i, i, i, i) v (${SHCNE_ASSOCCHANGED}, ${SHCNF_IDLIST}, 0, 0)'
FunctionEnd
