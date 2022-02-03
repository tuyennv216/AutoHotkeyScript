
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;--- Containers

; Danh sách tất cả container
::dsa::
    SendCombine2("docker ps -a", "Enter", 1)
Return

; Danh sách container đang chạy
::ds::
    SendCombine2("docker ps", "Enter", 1)
Return

; Danh sách custom
::dp::
    SendCombine2("docker ps ")
Return

; Chạy container
::dcs::
    SendCombine2("docker container start ")
Return

; Dừng container
::dss::
    SendCombine2("docker container stop ")
Return

; Tắt container
::dck::
    SendCombine2("docker container kill ")
Return

; Xóa container
::dcr::
    SendCombine2("docker container rm -f ")
Return

;--- Images

; Danh sách images
::di::
    SendCombine2("docker images", "Enter", 1)
Return

; Commit
::dc::
    SendCombine2("docker commit ")
Return

; Build image
::dib::
    SendCombine2("docker image build ")
Return

; Chạy 1 image
::dr::
    SendCombine2("docker run -it ")
Return

; Chạy 1 background image
::drr::
    SendCombine2("docker run -t -d ")
Return

; Xóa image
::dir::
    SendCombine2("docker image rm -f ")
Return

;--- Enviroment

; Xem config
::dci::
    SendCombine2("docker inspect -f ""{{  .Config.Env }}"" ")
Return

; Thay đổi config
::dcc::
    SendCombine2("docker commit --change ""ENV """, "Left", 1)
Return

; Thay đổi cmd
::dcd::
    SendCombine2("docker commit --change ""CMD """, "Left", 1)
Return

;--- Modify

; Chạy một cmd
::de::
    SendCombine2("docker exec -it ")
Return

; Attach container
::dt::
    SendCombine2("docker attach ")
Return

;--- Docker

; Restart docker
::drestart::
    SendCombine2("sudo systemctl restart docker")
Return

; Run docker command
::drun::
    SendCombine2("sudo chmod 666 /var/run/docker.sock")
Return


;--- Common function

SendCombine2(s1="", s2="", s3=0, s4="", s5=0, s6="", s7=0){
    BlockInput, On
    Sleep 10
    if !(s1 == "")
        Send {Text}%s1%
    if !(s2 == "")
        Send {%s2% %s3%}
    if !(s4 == "")
        Send {%s4% %s5%}
    if !(s6 == "")
        Send {%s6% %s7%}
    BlockInput, Off
}

SendCombine(s1="", s2="", s3=0, s4="", s5=0, s6="", s7=0){
    BlockInput, On
    saved := ClipboardAll
    if s1 != 
    {
        Clipboard := s1
        ClipWait
        Send +{Insert}
    }
    if !(s2 == "")
        Send {%s2% %s3%}
    if !(s4 == "")
        Send {%s4% %s5%}
    if !(s6 == "")
        Send {%s6% %s7%}
    Sleep 80
    Clipboard := saved
    ClipWait
    saved := ""
    BlockInput, Off
}

PasteText(string){
    BlockInput, On
    saved := ClipboardAll
    Clipboard := string
    ClipWait
    Sleep 80
    Send +{Insert}
    Sleep 80
    Clipboard := saved
    saved := ""
    ClipWait
    BlockInput, Off
}

SendText(string){
    BlockInput, On
    Send {Text}%string%
    BlockInput, Off
}

SendKey(key, time) {
    BlockInput, On
    Send {%key% %time%}
    BlockInput, Off
}

