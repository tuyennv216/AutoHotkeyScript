
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;--- Trạng thái

; Lấy trạng thái
::gs::
    SendCombine2("git status", "Enter", 1)
Return

; Lấy log
::gl::
    SendCombine2("git log", "Enter", 1)
Return

; Clone repository
::gce::
    SendCombine2("git clone ")
Return

;--- Checkout

; Checkout code
::gc::
    SendCombine2("git checkout ")
Return

; Tạo nhánh mới
::gcb::
    SendCombine2("git checkout -b ")
Return

; Lấy theo code đối phương
::gct::
    SendCombine2("git checkout --theirs .", "Enter", 1)
Return

; Lấy theo code của mình
::gco::
    SendCombine2("git checkout --ours .", "Enter", 1)
Return

; Đẩy code
::gpu::
    SendCombine2("git push ")
Return

; Đẩy code lên origin
::gpo::
    SendCombine2("git push origin")
Return

; Lấy thông tin về
::gf::
    SendCombine2("git fetch", "Enter", 1)
Return

; Lấy thông tin và code về
::gp::
    SendCombine2("git pull", "Enter", 1)
Return

;--- Nhánh

; Liệt kê danh sách nhánh
::gb::
    SendCombine2("git branch -a", "Enter", 1)
Return

; Xóa nhánh
::gbd::
    SendCombine2("git branch -d ")
Return

; Xóa nhánh (Force)
::gbdf::
    SendCombine2("git branch -D ")
Return

; Merge nhánh
::gm::
    SendCombine2("git merge ")
Return

; Merge nhánh no-ff
::gmf::
    SendCombine2("git merge --no-ff ")
Return

; Hủy bỏ merge
::gma::
    SendCombine2("git merge --abort", "Enter", 1)
Return

; Rebase nhánh
::grb::
    SendCombine2("git rebase ")
Return

;--- Reset

; Reset mềm
::grs::
    SendCombine2("git reset ")
Return

; Reset cứng
::grsh::
    SendCombine2("git reset --hard ")
Return

; Phục hồi file
::grt::
    SendCombine2("git restore ")
Return

; Phục hồi trạng thái
::grts::
    SendCombine2("git restore --staged ")
Return

; Clear file tạm
::gcl::
    SendCombine2("git clean -f", "Enter", 1)
Return

; Clear file và folder tạm
::gcld::
    SendCombine2("git clean -fd")
Return

;--- Commit

; Thêm file
::ga::
    SendCombine2("git add ")
Return

; Commit
::gcm::
    SendCombine2("git commit -m """"", "Left", 1)
Return

; Commit amend
::gcma::
    SendCombine2("git commit --amend -m """"", "Left", 1)
Return

;--- Stash

; Liệt kê danh sách stash
::gsl::
    SendCombine2("git stash list", "Enter", 1)
Return

; Lưu vào stash
::gsv::
    SendCombine2("git stash save """"", "Left", 1)
Return

; Lấy và apply từ stash
::gsa::
    SendCombine2("git stash apply stash@{0}", "Left", 1)
Return

; Lấy và xóa khỏi stash list
::gsp::
    SendCombine2("git stash pop", "Enter", 1)
Return

; Xóa stash
::gsc::
    SendCombine2("git stash clear", "Enter", 1)
Return

;--- Tag

; Hiển thị danh sách tag
::gtn::
    SendCombine2("git tag -n")
Return

; Tạo một lightweight tag
::gt::
    SendCombine2("git tag ")
Return

; Tạo một annotated tag
::gta::
    SendCombine2("git tag -a ")
Return

; Tạo một comment tag
::gtam::
    SendCombine2("git tag -am """"", "Left", 1)
Return

; Xóa tag
::gtd::
    SendCombine2("git tag -d ")
Return

;--- Config

; Config email
::gcue::
    SendCombine2("git config user.email ")
Return

; Config username
::gcun::
    SendCombine2("git config user.name ")
Return

;--- Xem log

; Lấy log 1 dòng
::glog::
    SendCombine2("git log --oneline", "Enter", 1)
Return

; Lấy 1 log theo mã hash
::gsh::
    SendCombine2("git show ")
Return

; Lấy 1 log theo thứ tự HEAD
::gshn::
    SendCombine2("git show HEAD^")
Return

; Lấy log commit 0
::gsh0::
    SendCombine2("git show HEAD^0", "Enter", 1)
Return

; Lấy log commit 1
::gsh1::
    SendCombine2("git show HEAD^1", "Enter", 1)
Return

; Lấy log commit 2
::gsh2::
    SendCombine2("git show HEAD^2", "Enter", 1)
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
    Send %string%{Enter}
    Sleep 500
    Send {End}
    Send {Enter}
    BlockInput, Off
}

