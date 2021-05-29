
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;--- Config

; Show config
::kcv::
    SendCombine2("kubectl config view", "Enter", 1)
Return

;--- Apply

; Create new object
::kaf::
    SendCombine2("kubectl apply -f ")
Return

; Create new deployment
::kcd::
    SendCombine2("kubectl create deployment ")
Return

; Get the documentation
::kep::
    SendCombine2("kubectl explain pods", "Enter", 1)
Return

; Create new secret
::kcsc::
    SendCombine2("kubectl create secret generic  --from-literal=", "Left", 16)
Return

;--- Viewing, finding

; List all services
::kgs::
    SendCombine2("kubectl get services", "Enter", 1)
Return

; List all services sort by name
::kgssn::
    SendCombine2("kubectl get services --sort-by=.metadata.name", "Enter", 1)
Return

; List all pods
::kgp::
    SendCombine2("kubectl get pods", "Enter", 1)
Return

; List all pods in all namespaces
::kgpa::
    SendCombine2("kubectl get pods --all-namespaces", "Enter", 1)
Return

; List all deployments
::kgd::
    SendCombine2("kubectl get deployments", "Enter", 1)
Return

; Describe nodes
::kdn::
    SendCombine2("kubectl describe nodes ")
Return

; Describe pods
::kdp::
    SendCombine2("kubectl describe pods ")
Return

; List events sorted by timestamp
::kgest::
    SendCombine2("kubectl get events --sort-by=.metadata.creationTimestamp", "Enter", 1)
Return

; Compares state
::kdf::
    SendCombine2("kubectl diff -f ")
Return

; List all secrets
::kgsc::
    SendCombine2("kubectl get secrets", "Enter", 1)
Return

;--- Updating

; Updating the image
::ksid::
    SendCombine2("kubectl set image deployment/")
Return

; Check the history of deployment
::krhd::
    SendCombine2("kubectl rollout history deployment/")
Return

; Rollback to a specific revision
::krud::
    SendCombine2("kubectl rollout undo deployment/")
Return

; Watch rolling status
::krsd::
    SendCombine2("kubectl rollout status -w deployment/")
Return

; Rolling restart
::krrd::
    SendCombine2("kubectl rollout restart deployment/")
Return

; Force replace
::krf::
    SendCombine2("kubectl replace --force -f ")
Return

; Create a nginx service
::kern::
    SendCombine2("kubectl expose rc nginx --port= --target-port=", "Left", 15)
Return

; Add a label
::klp::
    SendCombine2("kubectl label pods  new-label=", "Left", 11)
Return

; Auto slace a deployment
::kad::
    SendCombine2("kubectl autoscale deployment ")
Return

;--- Patching

; Partially update a node
::kpn::
    SendCombine2("kubectl patch node ")
Return

; Update a image
::kpp::
    SendCombine2("kubectl patch pod ")
Return

;--- Editing

; Edit the service
::kes::
    SendCombine2("kubectl edit svc/")
Return

;--- Scaling

; Scale a replicaset
::ksr::
    SendCombine2("kubectl scale --replicas=")
Return

;--- Deleting

; Delete pod
::kdp::
    SendCombine2("kubectl delete -f ")
Return

; Delete pod, service
::kdps::
    SendCombine2("kubectl delete pod,service ")
Return

;--- Interacting

; Dump pod logs
::kl::
    SendCombine2("kubectl logs ")
Return

; Run command
::kri::
    SendCombine2("kubectl run -I ")
Return

; Attach to running container
::ka::
    SendCombine2("kubectl attach  -i", "Left", 3)
Return

; Port forward
::kpf::
    SendCombine2("kubectl port-forward ")
Return

; Exec command
::ke::
    SendCombine2("kubectl exec ")
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

