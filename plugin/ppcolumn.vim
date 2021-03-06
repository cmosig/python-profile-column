" enable sign column
set signcolumn=yes

function! RunKernprofForeground()
    " save first
    write
    
    " run script in foreground
    !kernprof -l % 
endfunction

function! RunKernprofBackground()
    " save first
    write

    " run profiled script
    call system("kernprof -l ". expand('%'))
endfunction

function! RunAndPrintBackground()
    call RunKernprofBackground()
    call UpdateProfileColumn()
endfunction

function! RunAndPrintForeground()
    call RunKernprofForeground()
    call UpdateProfileColumn()
endfunction

function! UpdateProfileColumn()
    let profile_file = expand('%') . ".lprof"

    " check if profile file exists
    if !filereadable(profile_file)
        echom "Profile file does not exist. Call RunKernprofBackground() first."
        return
    endif

    " remove all old signs
    call sign_unplace('*')

    " command to get ascii representation of kernprof results
    let command = "python3 -m line_profiler " . profile_file . " | tail +11 | awk 'NF' |"

    " the percentages each line took
    let profileNums = systemlist(command . "awk -F ' ' '{print $5}'")
    let max_num = max(profileNums)

    " line numbers for the percentages
    let lineNums = systemlist(command . "awk -F ' ' '{print $1}'")

    " code
    let code = systemlist(command . "awk -F ' ' '{print $2}'")

    let counter = 0
    while counter < len(profileNums)
        
        " take maximum 2 characters and replace any odd dots
        let displayChars  = substitute(profileNums[counter][:1], '\.', '', '')

        " catch empty lines
        if displayChars == ""
            let counter += 1
            continue
        endif

        " catch comments
        if code[counter][0] == '#'
            let counter += 1
            continue
        endif
        
        " temporary sign name
        let signName = "profile". counter

        " define tempory signs and overwrite previous ones
        if displayChars == max_num
            call sign_define(signName, {'text': displayChars, 'texthl':"Number"})
        else
            call sign_define(signName, {'text': displayChars, 'texthl':"Normal"})
        endif


        " place the signs at the supplied line number
        call sign_place(100, '', signName, "%", {'lnum':lineNums[counter]}) 

        " loop counter increase
        let counter += 1
    endwhile
endfunction
