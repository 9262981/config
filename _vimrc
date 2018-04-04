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
Plugin 'scrooloose/nerdcommenter'   "����ע��\ccע��\cu\ciȡ��ע�� 
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
" ���� leader ��������Ϊ�պż���Ҳ��������Ϊ������
"let mapleader=" "


"________________________________________________________________________________________________________________baseConfig
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	"  Use Vim defaults instead of 100% vi compatibility(�ʺϵ�) ȥ��������й�viһ����ģʽ��������ǰ�汾��һЩbug�;��� ; ��Ҫʹ��vi�ļ���ģʽ������vim�Լ���
"set compatible     " be iMproved(������), required ������ vim �ر�������չ�Ĺ��ܣ�����ģ�� vi ����Ϊ

"set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

"___________________________________________________________________________________________________________�ļ����ͼ�⹦��
"����                            ���    plugin  indent 
"filetype on                    ��    δ�ı�  δ�ı�
"filetype off                   �ر�    δ�ı�  δ�ı�
"filetype plugin on             ��    ��    δ�ı�
"filetype plugin off            δ�ı�  �ر�    δ�ı�
"filetype indent on             ��    δ�ı�  ��
"filetype indent off            δ�ı�  δ�ı�  �ر�
filetype plugin indent on     " ��    ��    ��
"filetype plugin indent off     δ�ı�  �ر�    �ر�



"______________________________________________________________________________________________________________��ݼ��Զ���

inoremap ff <esc> 
" ff �˳�insertģʽ
nmap <F8> :TagbarToggle<CR>
"__________________________________________________________________________________________________________________��ʾ����

colorscheme desert  " ������ɫ����
set showmatch         " ������ʾ��Ӧ������
set number            " ��ʾ�к�
set cindent           " C���Ķ��뷽ʽ
set autoindent        " �Զ�����
set confirm           " �ڴ���δ�����ֻ���ļ���ʱ�򣬵���ȷ��
set tabstop=2         " Tab���Ŀ��
syntax on             " �Զ��﷨����
"set incsearch        	" �������ַ�����
set matchtime=5       " ��Ӧ���Ÿ�����ʱ�䣨��λ��ʮ��֮һ�룩
set encoding=utf-8  
  
set fileencodings=utf-8,chinese,latin-1  
  
if has("win32")  
  
 set fileencoding=chinese  
  
else  
  
 set fileencoding=utf-8  
  
endif  
  
"����˵�����  
  
source $VIMRUNTIME/delmenu.vim  
  
source $VIMRUNTIME/menu.vim  
  
"���consle�������  
  
language messages zh_CN.utf-8  
set softtabstop=2
set shiftwidth=2      "  ͳһ����Ϊ4
"set guifont=Consolas/22      " ��������
set guifont=Consolas:h10
set linespace=3
set hlsearch
" ------------------------------------------------------------
"  NERDTree-Config
" ------------------------------------------------------------
"_____________________________________________________________________________________________________________NERDTree-Config
autocmd VimEnter * NERDTree "vim �����Զ���������,���������
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


" ���ÿ�ݼ����ر�һ������
map <leader>wq :wq<CR>
set noundofile                                                       " vim8 ������'.un~'��2�����ļ�
set nobackup                                                         " �����ޱ����ļ���������Ĭ�Ͽ�����
set noswapfile   

"����ģʽ�µ��ƶ�Ctrl+k/j,alt+h/l;��β�����пո� jj תΪnormal ģʽ
imap <c-k> <up>
imap <c-j> <down>
imap <c-l> <right>
imap <c-h> <left>
