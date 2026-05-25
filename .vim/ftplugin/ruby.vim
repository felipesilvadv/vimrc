" let b:ale_ruby_sorbet_initialization_options = { 'highlightUntyped': v:true }

" call ale#linter#Define('ruby', {
" \   'name': 'sorbet',
" \   'aliases': ['srb'],
" \   'lsp': 'stdio',
" \   'language': 'ruby',
" \   'executable': {b -> ale#Var(b, 'ruby_sorbet_executable')},
" \   'command': function('ale_linters#ruby#sorbet#GetCommand'),
" \   'project_root': function('getcwd'),
" \   'initialization_options': {b -> ale#Var(b, 'ruby_sorbet_initialization_options')}
" \})

let b:ale_linters = ["ruby", "sorbet", "rubocop", "brakeman"]
let b:ale_fixers = ["rubocop", "sorbet"]
