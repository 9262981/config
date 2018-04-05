source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			if empty(&shellxquote)
				let l:shxq_sav = ''
				set shellxquote&
			endif
			let cmd = '"' . $VIMRUNTIME . '\diff"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
	if exists('l:shxq_sav')
		let &shellxquote=l:shxq_sav
	endif
endfunction
"-----------------------vendle-setting--------------------------------------"


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'scrooloose/nerdcommenter'   "代码注释\cc注释\cu\ci取消注释 
" All of your Plugins must be added before the following line

call vundle#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
" details or wiki for FAQ
" Put your non-Plugin stuff after this line

"autocmd vimenter * NERDTree
"autocmd BufWritePre *.vue silent! :/<script>/+1,/<\/script>/-1 !standard --fix --stdin
"autocmd BufWritePre *.vue silent! :/<template>/+1,/<\/template>/-1 !html-beautify --stdin
"autocmd BufWritePre *.vue silent! :/<style lang="scss">/+1,/<\/style>/-1 !sass-convert --from scss --to scss --stdin
" 设置 leader 键，例子为空号键，也可以设置为其他的
"let mapleader=" "


"________________________________________________________________________________________________________________baseConfig
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	"  Use Vim defaults instead of 100% vi compatibility(适合的) 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限 ; 不要使用vi的键盘模式，而是vim自己的
"set compatible     " be iMproved(改良的), required 就是让 vim 关闭所有扩展的功能，尽量模拟 vi 的行为

"set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

"___________________________________________________________________________________________________________文件类型检测功能
"命令                            检测    plugin  indent 
"filetype on                    打开    未改变  未改变
"filetype off                   关闭    未改变  未改变
"filetype plugin on             打开    打开    未改变
"filetype plugin off            未改变  关闭    未改变
"filetype indent on             打开    未改变  打开
"filetype indent off            未改变  未改变  关闭
filetype plugin indent on     " 打开    打开    打开
"filetype plugin indent off     未改变  关闭    关闭



"______________________________________________________________________________________________________________快捷键自定义

inoremap ff <esc> 
" ff 退出insert模式
nmap <F8> :TagbarToggle<CR>
"__________________________________________________________________________________________________________________显示设置

colorscheme desert  " 设置颜色主题
set showmatch         " 高亮显示对应的括号
set number            " 显示行号
set cindent           " C风格的对齐方式
set autoindent        " 自动对齐
set confirm           " 在处理未保存或只读文件的时候，弹出确认
set tabstop=2         " Tab键的宽度
syntax on             " 自动语法高亮
"set incsearch        	" 搜索逐字符高亮
set matchtime=5       " 对应括号高亮的时间（单位是十分之一秒）
set encoding=utf-8  
  
set fileencodings=utf-8,chinese,latin-1  
  
if has("win32")  
  
 set fileencoding=chinese  
  
else  
  
 set fileencoding=utf-8  
  
endif  
  
"解决菜单乱码  
  
source $VIMRUNTIME/delmenu.vim  
  
source $VIMRUNTIME/menu.vim  
  
"解决consle输出乱码  
  
language messages zh_CN.utf-8  
set softtabstop=2
set shiftwidth=2      "  统一缩进为4
"set guifont=Consolas/22      " 设置字体
set guifont=Consolas:h10
set linespace=3
set hlsearch
" ------------------------------------------------------------
"  NERDTree-Config
" ------------------------------------------------------------
"_____________________________________________________________________________________________________________NERDTree-Config
autocmd VimEnter * NERDTree "vim 开启自动键入命令,开启侧边栏
"let NERDTreeWinPos='right'
let NERDTreeWinSize=30
map <F3> :NERDTreeToggle<CR>
" ------------------------------------------------------------
"  vim-jsx
" ------------------------------------------------------------
let g:jsx_ext_required = 0
"let g:jsx_pragma_required = 1

" ------------------------------------------------------------
"  vim-vue
" ------------------------------------------------------------
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css


" 设置快捷键，关闭一个窗口
map <leader>wq :wq<CR>
set noundofile                                                       " vim8 不保存'.un~'的2进制文件
set nobackup                                                         " 设置无备份文件；不设置默认开启；
set noswapfile   

"插入模式下的移动Ctrl+k/j,alt+h/l;行尾不能有空格 jj 转为normal 模式
imap <c-k> <up>
imap <c-j> <down>
imap <c-l> <right>
imap <c-h> <left>
