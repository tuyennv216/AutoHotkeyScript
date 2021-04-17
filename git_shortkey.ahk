
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
SetKeyDelay -1

;--- Trạng thái

; Lấy trạng thái
::gs::
    SendText("git status")
    SendKey("Enter", 1)
Return

; Lấy log
::gl::
    SendText("git log")
    SendKey("Enter", 1)
Return

; Clone repository
::gcl::
    SendText("git clone ")
Return

;--- Checkout

; Checkout code
::gc::
    SendText("git checkout ")
Return

; Tạo nhánh mới
::gcb::
    SendText("git checkout -b ")
Return

; Lấy theo code đối phương
::gct::
    SendText("git checkout --theirs .")
    SendKey("Enter", 1)
Return

; Lấy theo code của mình
::gco::
    SendText("git checkout --ours .")
    SendKey("Enter", 1)
Return

; Đẩy code
::gpu::
    SendText("git push ")
Return

; Đẩy code lên origin
::gpo::
    SendText("git push origin")
Return

; Lấy thông tin về
::gf::
    SendText("git fetch")
    SendKey("Enter", 1)
Return

; Lấy thông tin và code về
::gp::
    SendText("git pull")
    SendKey("Enter", 1)
Return

;--- Nhánh

; Liệt kê danh sách nhánh
::gb::
    SendText("git branch -a")
    SendKey("Enter", 1)
Return

; Xóa nhánh
::gbd::
    SendText("git branch -d ")
Return

; Xóa nhánh (Force)
::gbdf::
    SendText("git branch -D ")
Return

; Merge nhánh
::gm::
    SendText("git merge ")
Return

; Rebase nhánh
::grb::
    SendText("git rebase ")
Return

;--- Reset

; Reset mềm
::gr::
    SendText("git reset ")
Return

; Reset cứng
::grh::
    SendText("git reset --hard ")
Return

; Phục hồi file
::grt::
    SendText("git restore ")
Return

; Phục hồi trạng thái
::grs::
    SendText("git restore --staged ")
Return

; Clear file tạm
::gcn::
    SendText("git clear -f")
    SendKey("Enter", 1)
Return

;--- Commit

; Thêm file
::ga::
    SendText("git add ")
Return

; Commit
::gcm::
    SendText("git commit -m """"")
    SendKey("Left", 1)
Return

;--- Stash

; Liệt kê danh sách stash
::gsl::
    SendText("git stash list")
    SendKey("Enter", 1)
Return

; Lưu vào stash
::gsv::
    SendText("git stash save")
    SendKey("Enter", 1)
Return

; Lấy và apply từ stash
::gsa::
    SendText("git stash apply")
    SendKey("Enter", 1)
Return

; Lấy và xóa khỏi stash list
::gsp::
    SendText("git stash pop")
    SendKey("Enter", 1)
Return


;--- Common function

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

