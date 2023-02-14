local keybind = {}
keybind.cmp = {
    select_next_item = "<C-k>",
    select_prev_item = "<C-j>",
    scroll_docs_down = "<C-l>",
    scroll_docs_up = "<C-h>",
    complete = "<C-Space>",
    abort = "<C-e>",
    comfirm = "<Tab>"
}
keybind.leap = {
    repeat_search = "<enter>",
    next_phase_one_target = "<enter>",
    next_target = {"k", ";"},
    prev_target = {"j", ","},
    next_group = "k",
    prev_group = "j",
    multi_accept = "<enter>",
    multi_revert = "<backspace>"
}
return keybind
