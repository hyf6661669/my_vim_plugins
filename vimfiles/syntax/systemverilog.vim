"Author: Nachum Kanovsky
"Email: nkanovsky yahoo com
" Modified by HYF
"Version: 1.9
if exists("b:current_syntax")
	finish
endif

let b:current_syntax = "systemverilog"

syntax keyword svTodo TODO FIXME TBD ATTENTION contained
syntax match svLineComment "//.*" contains=svTodo
syntax region svBlockComment start="/\*" end="\*/" contains=svTodo
syntax keyword svBoolean true false TRUE FALSE
syntax region svString start=+"+ skip=+\\"+ end=+"+
syntax keyword svType real realtime event reg wire integer logic bit time byte chandle genvar signed unsigned shortint shortreal string void int specparam
syntax keyword svDirection input output inout ref
syntax keyword svStorageClass parameter localparam virtual var protected rand const static automatic extern forkjoin export import
syntax match svInvPre "`\(\K\k*\)*\>"
syntax match svPreProc "`\(__FILE__\|__LINE__\|begin_keywords\|celldefine\|default_nettype\|end_keywords\|endcelldefine\|include\|line\|nounconnected_drive\|pragma\|resetall\|timescale\|unconnected_drive\|undef\|undefineall\)\>"
syntax match svPreCondit "`\(else\|elsif\|endif\|ifdef\|ifndef\)\>"
syntax match svInclude "`include\>"
syntax match svDefine "`define\>"
syntax keyword svConditional if else iff
syntax match svLabel "\v^\W*[a-zA-Z_]+[a-zA-Z_0-9]*\s*(\[.{-}\])?\s*:"he=e-1 contained
syntax region svCase matchgroup=svConditional start="\<casez\|casex\|case\>" end="\<endcase\>" contains=ALL
syntax keyword svRepeat for foreach do while forever repeat
syntax keyword svKeyword fork join join_any join_none begin end module endmodule function endfunction task endtask always always_ff always_latch always_comb initial this generate endgenerate config endconfig class endclass clocking endclocking interface endinterface module endmodule package endpackage modport posedge negedge edge defparam assign deassign alias return disable wait continue and buf bufif0 bufif1 nand nor not or xnor xor tri tri0 tri1 triand trior trireg pull0 pull1 pullup pulldown cmos default endprimitive endspecify endtable force highz0 highz1 ifnone large macromodule medium nmos notif0 notif1 pmos primitive rcmos release rnmos rpmos rtran rtranif0 rtranif1 scalared small specify strong0 strong1 supply0 supply1 table tran tranif0 tranif1 vectored wand weak0 weak1 wor cell design incdir liblist library noshowcancelled pulsestyle_ondetect pulsestyle_onevent showcancelled use instance uwire assert assume before bind bins binsof break constraint context cover covergroup coverpoint cross dist endgroup endprogram endproperty endsequence enum expect extends final first_match ignore_bins illegal_bins inside intersect local longint matches new null packed priority program property pure randc randcase randsequence sequence solve struct super tagged throughout timeprecision timeunit type typedef union unique wait_order wildcard with within accept_on checker endchecker eventually global implies let nexttime reject_on restrict s_always s_eventually s_nexttime s_until s_until_with strong sync_accept_on sync_reject_on unique0 until until_with untyped weak implements interconnect nettype soft


syntax match svInteger "\<\(\.\)\@<![0-9_]\+\(\s*['.]\)\@!\>"
syntax match svInteger "\(\<[0-9_]\+\s*\)\?'\(s\|S\)\?\(d\|D\)\s*[0-9_ZzXx?]\+"
syntax match svInteger "\(\<[0-9_]\+\s*\)\?'\(s\|S\)\?\(h\|H\)\s*[0-9a-fA-F_ZzXx?]\+"
syntax match svInteger "\(\<[0-9_]\+\s*\)\?'\(s\|S\)\?\(o\|O\)\s*[0-7_ZzXx?]\+"
syntax match svInteger "\(\<[0-9_]\+\s*\)\?'\(s\|S\)\?\(b\|B\)\s*[01_ZzXx?]\+"
syntax match svInteger "\<'\(d\|D\|h\|H\|o\|O\|b\|B\)\>"
syntax match svInteger "'[01xXzZ?]\>"

syntax match svFloat "\<\d[0-9_]*\(\.[0-9_]\+\)\=\([fpnum]\)\=s\>"
syntax match svFloat "\<[0-9_]\+\.[0-9_]\+\(\(e\|E\)[+-]\?[0-9_]\+\)\?\>"
syntax match svFloat "\<[0-9_]\+\(e\|E\)[+-]\?[0-9_]\+\>"
syntax match svFloat "\d\+f"
"fp number, with a dot, optional exponent
syntax match svFloat "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"fp number, starting with a dot, optional exponent
syntax match svFloat "\.\d\+\(e[-+]\=\d\+\)\=[fl]\+\>"
"fp number, without a dot, with exponent
syntax match svFloat "\d\+e[-+]\=\d\+[fl]\=\>"
"hex fp number, optional leading digits, with a dot, with exponent
syntax match svFloat "0x\x*\.\x\+p\[-+]\=\d\+[fl]\=\>"
"hex fp number, with leading digits, optional dot, with exponent
syntax match svFloat "0x\x\+\.\=p[-+]\=\d\+[fl]\=\>"

syntax match svConstant "\<[A-Z][A-Z0-9_$]*\>"

syntax match svGlobal "`[a-zA-Z_][a-zA-Z0-9_$]\+"
syntax match svGlobal "$[a-zA-Z0-9_$]\+"

syntax keyword svStructure struct union enum
syntax keyword svTypedef typedef
syntax match svInvSystemFunction "\$\(\K\k*\)"
syntax match svSystemFunction "\$\(display\|finish\|stop\|exit\|realtime\|stime\|time\|printtimescale\|timeformat\|bitstoreal\|realtobits\|bitstoshortreal\|shortrealtobits\|itor\|rtoi\|signed\|unsigned\|cast\|bits\|isunbounded\|typename\|unpacked_dimensions\|dimensions\|left\|right\|low\|high\|increment\|size\|clog2\|asin\|ln\|acos\|log10\|atan\|exp\|atan2\|sqrt\|hypot\|pow\|sinh\|floor\|cosh\|ceil\|tanh\|sin\|asinh\|cos\|acosh\|tan\|atanh\|countbits\|countones\|onehot\|onehot0\|isunknown\|fatal\|error\|warning\|info\|fatal\|error\|warning\|info\|asserton\|assertoff\|assertkill\|assertcontrol\|assertpasson\|assertpassoff\|assertfailon\|assertfailoff\|assertnonvacuouson\|assertvacuousoff\|sampled\|rose\|fell\|stable\|changed\|past\|past_gclk\|rose_gclk\|fell_gclk\|stable_gclk\|changed_gclk\|future_gclk\|rising_gclk\|falling_gclk\|steady_gclk\|changing_gclk\|coverage_control\|coverage_get_max\|coverage_get\|coverage_merge\|coverage_save\|get_coverage\|set_coverage_db_name\|load_coverage_db\|random\|urandom\|urandom_range\|dist_chi_square\|dist_erlang\|dist_exponential\|dist_normal\|dist_poisson\|dist_t\|dist_uniform\|q_initialize\|q_add\|q_remove\|q_full\|q_exam\|asyncandarray\|asyncandplane\|asyncnandarray\|asyncnandplane\|asyncorarray\|asyncorplane\|asyncnorarray\|asyncnorplane\|syncandarray\|syncandplane\|syncnandarray\|syncnandplane\|syncorarray\|syncorplane\|syncnorarray\|syncnorplane\|system\|contained\|transparent\)\>"
syntax match svSystemFunction "\$\(fopen\|fdisplay\|fclose\)\>"

syntax match svObjectFunctions "\.\(num\|size\|delete\|exists\|first\|last\|next\|prev\|insert\|pop_front\|pop_back\|push_front\|push_back\|find\|find_index\|find_first\|find_first_index\|find_last\|find_last_index\|min\|max\|reverse\|sort\|rsort\|shuffle\|sum\|product\|and\|or\|xor\)\>\(\s\|\n\)*("he=e-1
syntax match svOperator "\(\~\|&\||\|\^\|=\|!\|?\|:\|@\|<\|>\|%\|+\|-\|\*\|\/[\/\*]\@!\)"
syntax match svDelimiter "\({\|}\|(\|)\)"

highlight svTodo guifg=#00FFFF guibg=bg gui=bold
highlight svLineComment guifg=#87ff87
highlight svBlockComment guifg=#87ff87
highlight! default link svBoolean Boolean
highlight! default link svString String
highlight svType gui=NONE guifg=#00afff guibg=NONE ctermfg=115 ctermbg=NONE cterm=NONE
highlight! default link svDirection StorageClass
highlight! default link svStorageClass StorageClass
highlight! default link svPreProc PreProc
highlight! default link svPreCondit PreCondit
highlight! default link svInclude Include
highlight! default link svDefine Define
highlight! default link svConditional Conditional
highlight! default link svLabel Label
highlight! default link svRepeat Repeat

highlight svKeyword guifg=#f92672 gui=bold
highlight svInteger guifg=#00cdcd guibg=#000000
highlight svFloat guifg=#00cdcd guibg=#000000
highlight svConstant guifg=#ff00ff

highlight! default link svGlobal Define
highlight svStructure guifg=#66d9ef

highlight! default link svTypedef Typedef
highlight svSystemFunction guifg=#bcdbff gui=bold
highlight! default link svOperator Operator
highlight! default link svDelimiter Delimiter
highlight svObjectFunctions guifg=#bcdbff gui=bold

highlight! default link svCase none
highlight! default link svInvPre none
highlight! default link svInvSystemFunction none
