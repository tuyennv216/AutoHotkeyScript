
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;--- Config

; Show config
::kc::
    SendCombine2("microk8s kubectl config view", "Enter", 1)
Return

;--- Apply

; Create new object
::ka::
    SendCombine2("microk8s kubectl apply -f ")
Return

; Create new deployment
::kd::
    SendCombine2("microk8s kubectl create deployment ")
Return

; Get the documentation
::ked::
    SendCombine2("microk8s kubectl explain pods", "Enter", 1)
Return

; Create new secret
::ksc::
    SendCombine2("microk8s kubectl create secret generic  --from-literal=", "Left", 16)
Return

;--- Viewing, finding

; List all services
::ks::
    SendCombine2("microk8s kubectl get services", "Enter", 1)
Return

; List all services sort by name
::ksn::
    SendCombine2("microk8s kubectl get services --sort-by=.metadata.name", "Enter", 1)
Return

; List all pods
::kp::
    SendCombine2("microk8s kubectl get pods", "Enter", 1)
Return

; List all pods in all namespaces
::kpa::
    SendCombine2("microk8s kubectl get pods --all-namespaces", "Enter", 1)
Return

; List all deployments
::kd::
    SendCombine2("microk8s kubectl get deployments", "Enter", 1)
Return

; Describe nodes
::kin::
    SendCombine2("microk8s kubectl describe nodes ")
Return

; Describe pods
::kip::
    SendCombine2("microk8s kubectl describe pods ")
Return

; List events sorted by timestamp
::ket::
    SendCombine2("microk8s kubectl get events --sort-by=.metadata.creationTimestamp", "Enter", 1)
Return

; Compares state
::kdf::
    SendCombine2("microk8s kubectl diff -f ")
Return

; List all secrets
::ksa::
    SendCombine2("microk8s kubectl get secrets", "Enter", 1)
Return

;--- Updating

; Updating the image
::kic::
    SendCombine2("microk8s kubectl set image deployment/")
Return

; Check the history of deployment
::krc::
    SendCombine2("microk8s kubectl rollout history deployment/")
Return

; Rollback to a specific revision
::krv::
    SendCombine2("microk8s kubectl rollout undo deployment/")
Return

; Watch rolling status
::krr::
    SendCombine2("microk8s kubectl rollout status -w deployment/")
Return

; Rolling restart
::ks::
    SendCombine2("microk8s kubectl rollout restart deployment/")
Return

; Force replace
::krf::
    SendCombine2("microk8s kubectl replace --force -f ")
Return

; Create a nginx service
::knginx::
    SendCombine2("microk8s kubectl expose rc nginx --port= --target-port=", "Left", 15)
Return

; Add a label
::klabel::
    SendCombine2("microk8s kubectl label pods  new-label=", "Left", 11)
Return

; Auto slace a deployment
::kauto::
    SendCombine2("microk8s kubectl autoscale deployment ")
Return

;--- Patching

; Partially update a node
::kpn::
    SendCombine2("microk8s kubectl patch node ")
Return

; Update a image
::kpd::
    SendCombine2("microk8s kubectl patch pod ")
Return

;--- Editing

; Edit the service
::ke::
    SendCombine2("microk8s kubectl edit svc/")
Return

;--- Scaling

; Scale a replicaset
::ksr::
    SendCombine2("microk8s kubectl scale --replicas=")
Return

;--- Deleting

; Delete pod
::kdp::
    SendCombine2("microk8s kubectl delete -f ")
Return

; Delete pod, service
::kdps::
    SendCombine2("microk8s kubectl delete pod,service ")
Return

;--- Interacting

; Dump pod logs
::klog::
    SendCombine2("microk8s kubectl logs ")
Return

; Run command
::kr::
    SendCombine2("microk8s kubectl run -I ")
Return

; Attach to running container
::kt::
    SendCombine2("microk8s kubectl attach  -i", "Left", 3)
Return

; Port forward
::kpp::
    SendCombine2("microk8s kubectl port-forward ")
Return

; Exec command
::kx::
    SendCombine2("microk8s kubectl exec ")
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

