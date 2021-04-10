
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;--- Commands trạng thái

; Lấy trạng thái
::gs::
    Paste("git status")
    SendEnter()
Return

; Lấy log
::gl::
    Paste("git log")
    SendEnter()
Return

; Clone repository
::gcl::
    Paste("git clone ")
Return

;--- Commands checkout

; Kéo code về
::gc::
    Paste("git checkout ")
Return

; Tạo nhánh mới
::gcb::
    Paste("git checkout -b ")
Return

;--- Tạo nhánh mới

; Lấy theo code đối phương
::gct::
    Paste("git checkout --theirs .")
    SendEnter()
Return

; Lấy theo code của mình
::gco::
    Paste("git checkout --ours .")
    SendEnter()
Return

;--- Commands branch
::gb::
    Paste("git branch -a")
    SendEnter()
Return

::gbd::
    Paste("git branch delete ")
Return

::gm::
    Paste("git merge ")
Return

::grb::
    Paste("git rebase ")
Return

;--- Commands reset

; Reset mềm
::gr::
    Paste("git reset ")
Return

; Reset cứng
::grh::
    Paste("git reset --hard ")
Return

;--- Commands add, restore, commit

; Thêm file
::ga::
    Paste("git add ")
Return

; Commit
::gcm::
    Paste("git commit -m """"")
	SendLeft()
Return

; Phục hồi lại file như trước khi thay đổi
::grt::
    Paste("git restore ")
Return

; Remove file
::grmf::
    Paste("git rm -f ")
Return

; Remove folder
::grmd::
    Paste("git rm -r -f ")
Return

;--- Commands lấy và đẩy code

; Đẩy code
::gp::
    Paste("git push ")
Return

; Đẩy code lên remote
::gpo::
    Paste("git push origin ")
Return

; Kéo metadata về
::gft::
    Paste("git fetch")
    SendEnter()
Return

; Kéo metadata + code về
::gpl::
    Paste("git pull")
    SendEnter()
Return

;--- Commands stash

; Hiển thị danh sách stash
::gsl::
    Paste("git stash list")
    SendEnter()
Return

; Lưu các thay đổi hiện tại vào stash
::gsv::
    Paste("git stash save")
    SendEnter()
Return

; Paste stash mới nhất và xóa nó khỏi stash list
::gsp::
    Paste("git stash pop")
    SendEnter()
Return


;--- Common functions

; Chèn text vào clipboard và paste
Paste(string){
	clipboard := string
	clipwait
	BlockInput, On

	; Git bash sử dụng Insert để paste
	; Send {Insert}

	; Window sử dụng Ctrl + v để paste
	Send ^v

	BlockInput, off
}

; Gửi phím enter
SendEnter() {
	Send {Enter}
}

; Gửi phím mũi tên sang trái
SendLeft() {
	Send {Left}
}
