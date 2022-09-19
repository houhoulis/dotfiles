# Always installs bindings for insert and default mode for simplicity and b/c it has almost no side-effect
# https://gitter.im/fish-shell/fish-shell?at=60a55915ee77a74d685fa6b1
function fzf_configure_bindings --description "Installs the default key bindings for fzf.fish with user overrides passed as options."
    # no need to install bindings if not in interactive mode or running tests
    status is-interactive || test "$CI" = true; or return

    set -g _fzf_key_sequence_descriptions directory git_log git_status git_branches history variables processes magic pick
    set options_spec h/help {$_fzf_key_sequence_descriptions}'=?'
    argparse --max-args=0 --ignore-unknown $options_spec -- $argv 2>/dev/null
    if test $status -ne 0
        echo "Invalid option or a positional argument was provided." >&2
        _fzf_configure_bindings_help
        return 22
    else if set --query _flag_help
        _fzf_configure_bindings_help
        return
    else
        # Initialize with default key sequences and then override or disable them based on flags
        # index 1 = directory, 2 = git_log, 3 = git_status, 4 = git_branches, 5 = history, 6 = variables, 7 = processes, 8 = magic, 9 = pick
        set --global _fzf_key_sequences \e\cf \e\cl \e\cs \e\cb \cr \cv \e\cp \em \ex # \c = control, \e = escape
        set --query _flag_directory && set _fzf_key_sequences[1] "$_flag_directory"
        set --query _flag_git_log && set _fzf_key_sequences[2] "$_flag_git_log"
        set --query _flag_git_status && set _fzf_key_sequences[3] "$_flag_git_status"
        set --query _flag_git_branches && set _fzf_key_sequences[4] "$_flag_git_branches"
        set --query _flag_history && set _fzf_key_sequences[5] "$_flag_history"
        set --query _flag_variables && set _fzf_key_sequences[6] "$_flag_variables"
        set --query _flag_processes && set _fzf_key_sequences[7] "$_flag_processes"
        set --query _flag_magic && set _fzf_key_sequences[8] "$_flag_magic"
        set --query _flag_pick && set _fzf_key_sequences[9] "$_flag_pick"

        # If fzf bindings already exists, uninstall it first for a clean slate
        if functions --query _fzf_uninstall_bindings
            _fzf_uninstall_bindings
        end

        set --global _fzf_key_binded_functions \
            _fzf_search_directory \
            _fzf_search_git_log \
            _fzf_search_git_status \
            _fzf_search_git_branches \
            _fzf_search_history \
            "$_fzf_search_vars_command" \
            _fzf_search_processes \
            _fzf_magic_mode \
            _fzf_pick_mode


        for mode in default insert
            for i in (seq (count $_fzf_key_sequences))
                test -n $_fzf_key_sequences[$i] && bind --mode $mode $_fzf_key_sequences[$i] $_fzf_key_binded_functions[$i]
            end
        end

        function _fzf_uninstall_bindings --inherit-variable _fzf_key_sequences
            bind --erase -- $_fzf_key_sequences
            bind --erase --mode insert -- $_fzf_key_sequences
        end
    end
end
