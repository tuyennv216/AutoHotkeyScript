
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;--- Name

; Short name
::mkctl::
    SendCombine2("microk8s kubectl ")
Return

;--- View

; List all
::ka::
    SendCombine2("microk8s kubectl get all", "Enter", 1)
Return

; List all services
::ks::
    SendCombine2("microk8s kubectl get services", "Enter", 1)
Return

; List all pods
::kp::
    SendCombine2("microk8s kubectl get pods", "Enter", 1)
Return

; List all deployments
::kd::
    SendCombine2("microk8s kubectl get deployments", "Enter", 1)
Return

; List all images
::ki::
    SendCombine2("microk8s ctr images ls", "Enter", 1)
Return

; List all images contains name
::kin::
    SendCombine2("microk8s ctr images ls ""name~=""", "Left", 1)
Return

; List all namespaces
::kn::
    SendCombine2("microk8s kubectl get ns", "Enter", 1)
Return

; List all secrets
::ksc::
    SendCombine2("microk8s kubectl get secrets", "Enter", 1)
Return

;--- Describe

; Describe pod
::kdp::
    SendCombine2("microk8s kubectl describe pod ")
Return

; Describe node
::kdn::
    SendCombine2("microk8s kubectl describe node ")
Return

; Describe service
::kds::
    SendCombine2("microk8s kubectl describe service ")
Return

;--- Create

; Apply yaml file
::kaf::
    SendCombine2("microk8s kubectl apply -f ")
Return

; Create a deployment
::kcd::
    SendCombine2("microk8s kubectl create deployment ")
Return

; Create a secret
::kcs::
    SendCombine2("microk8s kubectl create secret generic  --from-literal=", "Left", 16)
Return

;--- Delete

; Delete something
::kdel::
    SendCombine2("microk8s kubectl delete ")
Return

; Delete a pod
::kdelp::
    SendCombine2("microk8s kubectl delete pod ")
Return

; Delete a service
::kdels::
    SendCombine2("microk8s kubectl delete svc ")
Return

; Delete a deployment
::kdeld::
    SendCombine2("microk8s kubectl delete deployment ")
Return

; Delete a app
::kdela::
    SendCombine2("microk8s kubectl delete all -l app=")
Return

; Delete a secret
::kdelsc::
    SendCombine2("microk8s delete secret ")
Return

; Rollout all deployment
::kro::
    SendCombine2("microk8s kubectl rollout restart deployment", "Enter", 1)
Return

; Rollout all deployment of an app
::krod::
    SendCombine2("kubectl rollout restart deployment ")
Return

;--- Patch

; Patch a node
::kpn::
    SendCombine2("microk8s kubectl patch node ")
Return

; Patch a pod
::kpp::
    SendCombine2("microk8s kubectl patch pod ")
Return

;--- Debug

; Attach to a container
::kt::
    SendCombine2("microk8s kubectl attach  -i", "Left", 3)
Return

; Run a command
::kr::
    SendCombine2("microk8s kubectl run -I ")
Return

; Exec a command
::kx::
    SendCombine2("microk8s kubectl exec ")
Return

; Get log
::klog::
    SendCombine2("microk8s kubectl logs ")
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

SendTest(string){
    BlockInput, On
    SendLevel, 0
    SendInput %string%{Tab}
    SendLevel, 1
    Send %string%{Enter}
    Sleep 500
    Send {End}
    Send {Enter}
    BlockInput, Off
}
