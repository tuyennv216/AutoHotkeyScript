
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;--- Trạng thái

; Lấy trạng thái
::gs::
    SendCombine("git status", "Enter", 1)
Return

; Lấy log
::gl::
    SendCombine("git log", "Enter", 1)
Return

; Clone repository
::gce::
    SendCombine("git clone ")
Return

;--- Checkout

; Checkout code
::gc::
    SendCombine("git checkout ")
Return

; Tạo nhánh mới
::gcb::
    SendCombine("git checkout -b ")
Return

; Lấy theo code đối phương
::gct::
    SendCombine("git checkout --theirs .", "Enter", 1)
Return

; Lấy theo code của mình
::gco::
    SendCombine("git checkout --ours .", "Enter", 1)
Return

; Đẩy code
::gpu::
    SendCombine("git push ")
Return

; Đẩy code lên origin
::gpo::
    SendCombine("git push origin")
Return

; Lấy thông tin về
::gf::
    SendCombine("git fetch", "Enter", 1)
Return

; Lấy thông tin và code về
::gp::
    SendCombine("git pull", "Enter", 1)
Return

;--- Nhánh

; Liệt kê danh sách nhánh
::gb::
    SendCombine("git branch -a", "Enter", 1)
Return

; Xóa nhánh
::gbd::
    SendCombine("git branch -d ")
Return

; Xóa nhánh (Force)
::gbdf::
    SendCombine("git branch -D ")
Return

; Merge nhánh
::gm::
    SendCombine("git merge ")
Return

; Rebase nhánh
::grb::
    SendCombine("git rebase ")
Return

;--- Reset

; Reset mềm
::gr::
    SendCombine("git reset ")
Return

; Reset cứng
::grh::
    SendCombine("git reset --hard ")
Return

; Phục hồi file
::grt::
    SendCombine("git restore ")
Return

; Phục hồi trạng thái
::grs::
    SendCombine("git restore --staged ")
Return

; Clear file tạm
::gcl::
    SendCombine("git clean -f", "Enter", 1)
Return

;--- Commit

; Thêm file
::ga::
    SendCombine("git add ")
Return

; Commit
::gcm::
    SendCombine("git commit -m """"", "Left", 1)
Return

;--- Stash

; Liệt kê danh sách stash
::gsl::
    SendCombine("git stash list", "Enter", 1)
Return

; Lưu vào stash
::gsv::
    SendCombine("git stash save", "Enter", 1)
Return

; Lấy và apply từ stash
::gsa::
    SendCombine("git stash apply", "Enter", 1)
Return

; Lấy và xóa khỏi stash list
::gsp::
    SendCombine("git stash pop", "Enter", 1)
Return


;--- Common function

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
    Send +{Insert}
    Sleep 80
    Clipboard := saved
    saved := ""
    ClipWait
    BlockInput, Off
}

SendText(string){
    BlockInput, On
    SendRaw %string%
    BlockInput, Off
}

SendKey(key, time) {
    BlockInput, On
    Send {%key% %time%}
    BlockInput, Off
}

