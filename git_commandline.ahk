
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;--- Trạng thái

; Lấy trạng thái
::gs::
    Paste("git status")
    SendEnter(1)
Return

; Lấy log
::gl::
    Paste("git log")
    SendEnter(1)
Return

; Clone repository
::gcl::
    Paste("git clone ")
Return

;--- Checkout

; Checkout code
::gc::
    Paste("git checkout ")
Return

; Tạo nhánh mới
::gcb::
    Paste("git checkout -b ")
Return

; Lấy theo code đối phương
::gct::
    Paste("git checkout --theirs .")
    SendEnter(1)
Return

; Lấy theo code của mình
::gco::
    Paste("git checkout --ours .")
    SendEnter(1)
Return

; Đẩy code
::gpu::
    Paste("git push ")
Return

; Đẩy code lên origin
::gpo::
    Paste("git push origin")
Return

; Lấy thông tin về
::gf::
    Paste("git fetch")
    SendEnter(1)
Return

; Lấy thông tin và code về
::gp::
    Paste("git pull")
    SendEnter(1)
Return

;--- Nhánh

; Liệt kê danh sách nhánh
::gb::
    Paste("git branch -a")
    SendEnter(1)
Return

; Xóa nhánh
::gbd::
    Paste("git branch delete ")
Return

; Merge nhánh
::gm::
    Paste("git merge ")
Return

; Rebase nhánh
::grb::
    Paste("git rebase ")
Return

;--- Reset

; Reset mềm
::gr::
    Paste("git reset ")
Return

; Reset cứng
::grh::
    Paste("git reset --hard ")
Return

;--- Commit

; Thêm file
::ga::
    Paste("git add ")
Return

; Commit
::gcm::
    Paste("git commit -m """"")
    SendLeft(1)
Return

; Phục hồi file
::grt::
    Paste("git restore ")
Return

; Xóa file
::grmf::
    Paste("git rm -f ")
Return

; Xóa folder
::grmd::
    Paste("git rm -r -f ")
Return

;--- Stash

; Liệt kê dánh sách stash
::gsl::
    Paste("git stash list")
    SendEnter(1)
Return

; Lưu vào stash
::gsv::
    Paste("git stash save")
    SendEnter(1)
Return

; Lấy và xóa khỏi stash list
::gsp::
    Paste("git stash pop")
    SendEnter(1)
Return


;--- Common function
Paste(string){
    clipboard := ""
    clipboard := string
    clipwait
    BlockInput, On

    ; Git bash uses Insert
    ;Send {Insert}

    ; Window uses Ctrl + v
    Send ^v

    BlockInput, Off
}

SendEnter(time) {
    BlockInput, On
    Send {Enter %time%}
    BlockInput, Off
}

SendLeft(time) {
    BlockInput, On
    Send {Left %time%}
    BlockInput, Off
}
