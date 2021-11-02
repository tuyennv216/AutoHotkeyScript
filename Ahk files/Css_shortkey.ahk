
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;--- Common

; flex horizontal
::flexw::
    SendText("display: flex;")
    SendKey("Enter", 1)
    SendText("justify-content: center;")
Return

; flex vertical
::flexh::
    SendText("display: flex;")
    SendKey("Enter", 1)
    SendText("align-items: center;")
Return

; flex center
::flexc::
    SendText("display: flex;")
    SendKey("Enter", 1)
    SendText("justify-content: center;")
    SendKey("Enter", 1)
    SendText("align-items: center;")
Return

; flex center space between
::flexcb::
    SendText("display: flex;")
    SendKey("Enter", 1)
    SendText("justify-content: space-between;")
    SendKey("Enter", 1)
    SendText("align-items: center;")
Return

;--- Display

; display flex
::df::
    SendText("display: flex;")
Return

; display block
::db::
    SendText("display: block;")
Return

; display initial
::di::
    SendText("display: initial;")
Return

;--- Flex options

; flex grow
::flg::
    SendText("flex-grow: ")
Return

; flex wrap
::flw::
    SendText("flex-wrap: ")
Return

; flex direction
::fld::
    SendText("flex-direction: ")
Return

;--- Justify

; justify content start
::jcs::
    SendText("justify-content: start;")
Return

; justify content center
::jcc::
    SendText("justify-content: center;")
Return

; justify content end
::jce::
    SendText("justify-content: end;")
Return

; justify content space between
::jcb::
    SendText("justify-content: space-between;")
Return

;--- Align

; align start
::ais::
    SendText("align-items: start;")
Return

; align center
::aic::
    SendText("align-items: center;")
Return

; align end
::aie::
    SendText("align-items: end;")
Return

;--- Extra

; box shadow
::bs::
    SendText("box-shadow: ")
Return

; border radius
::br::
    SendText("border-radius: ")
Return

; z index
::zx::
    SendText("z-index: ")
Return

;--- Background

; background
::bg::
    SendText("background: ")
Return

; background color
::bgc::
    SendText("background-color: ")
Return

; background image
::bgi::
    SendText("background-image: ")
Return

;--- Border

; border
::bo::
    SendText("border: ")
Return

; border color
::boc::
    SendText("border-color: ")
Return

; border top
::bot::
    SendText("border-top: ")
Return

; border bottom
::bob::
    SendText("border-bottom:")
Return

; border right
::bor::
    SendText("border-right: ")
Return

; border left
::bol::
    SendText("border-left: ")
Return

;--- Size

; width
::wi::
    SendText("width: ")
Return

; height
::he::
    SendText("height: ")
Return

; min width
::mw::
    SendText("min-width: ")
Return

; min height
::mh::
    SendText("min-height: ")
Return

; max width
::mmw::
    SendText("max-width: ")
Return

; max height
::mmh::
    SendText("max-height: ")
Return

; min width 2
::minw::
    SendText("min-width: ")
Return

; min height 2
::minh::
    SendText("min-height: ")
Return

; max width 2
::maxw::
    SendText("max-width: ")
Return

; max height 2
::maxh::
    SendText("max-height: ")
Return

;--- Margin

; margin
::ma::
    SendText("margin: ")
Return

; margin top
::mt::
    SendText("margin-top: ")
Return

; margin bottom
::mb::
    SendText("margin-bottom: ")
Return

; margin right
::mr::
    SendText("margin-right: ")
Return

; margin left
::ml::
    SendText("margin-left: ")
Return

;--- Font

; font family
::ff::
    SendText("font-family: ")
Return

; font-size
::fs::
    SendText("font-size: ")
Return

; font-weight
::fw::
    SendText("font-weight: ")
Return

; font-variant
::fv::
    SendText("font-variant: ")
Return

;--- Position

; position relative
::por::
    SendText("position: relative;")
Return

; position absolute
::poa::
    SendText("position: absolute;")
Return

; position fixed
::pof::
    SendText("position: fixed;")
Return

; position sticky
::pos::
    SendText("position: sticky;")
Return

;--- Text

; text align
::tea::
    SendText("text-align: ")
Return

; text decoration
::ted::
    SendText("text-decoration: ")
Return

; text indent
::tei::
    SendText("text-indent: ")
Return

;--- Padding

; padding
::pa::
    SendText("padding: ")
Return

; padding top
::pt::
    SendText("padding-top: ")
Return

; padding bottom
::pb::
    SendText("padding-bottom: ")
Return

; padding right
::pr::
    SendText("padding-right: ")
Return

; padding left
::pl::
    SendText("padding-left: ")
Return

;--- Overflow

; overflow
::ov::
    SendText("overflow: ")
Return

; overflow x
::ox::
    SendText("overflow-x: ")
Return

; overflow y
::oy::
    SendText("overflow-y: ")
Return

;--- Media

; extra small
::mxs::
    SendText("media screen and (max-width: 576px)")
Return

; small
::msm::
    SendText("media screen and (min-width: 576px)")
Return

; medium
::mmd::
    SendText("media screen and (min-width: 768px)")
Return

; large
::mlg::
    SendText("media screen and (min-width: 992px)")
Return

; extra large
::mxl::
    SendText("media screen and (min-width: 1200px)")
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

