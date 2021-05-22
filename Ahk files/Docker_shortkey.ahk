
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;--- Build

; Build and tag
::dbt::
    SendCombine2("docker build -t ")
Return

; List all images
::dls::
    SendCombine2("docker image ls", "Enter", 1)
Return

; Delete an image
::drm::
    SendCombine2("docker image rm ")
Return

;--- Share

; Pull an image
::dpl::
    SendCombine2("docker pull ")
Return

; Retag a local image
::dt::
    SendCombine2("docker tag ")
Return

; Push an image
::dpu::
    SendCombine2("docker push")
Return

;--- Run

; Run a container
::dcr::
    SendCombine2("docker container run ")
Return

; Stop a running container
::dcs::
    SendCombine2("docker container stop ")
Return

; Kill a running container
::dck::
    SendCombine2("docker container kill ")
Return

; List the network
::dnl::
    SendCombine2("docker network ls", "Enter", 1)
Return

; List the running containers
::dcls::
    SendCombine2("docker container ls", "Enter", 1)
Return

; Delete all running container
::dcrmfa::
    SendCombine2("docker container rm -f $(docker ps -aq)", "Enter", 1)
Return

; Print logs
::dclog::
    SendCombine2("docker container logs --tail 100 ")
Return

; List the running containers
::dps::
    SendCombine2("docker ps", "Enter", 1)
Return

; Execute the command
::de::
    SendCombine2("docker exec -it ")
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

