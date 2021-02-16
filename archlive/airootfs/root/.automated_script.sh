#!/usr/bin/env bash

install_st ()
{
	git clone https://github.com/NPScript/st.git
	cd st
	make install
	cd ~
}

install_dwm ()
{
	git clone https://github.com/NPScript/dwm.git
	cd dwm
	make install
	cd ~
}

install_dmenu ()
{
	git clone https://github.com/NPScript/dmenu.git
	cd dmenu
	make install
	cd ~
}

script_cmdline ()
{
    local param
    for param in $(< /proc/cmdline); do
        case "${param}" in
            script=*) echo "${param#*=}" ; return 0 ;;
        esac
    done
}

automated_script ()
{
    local script rt
    script="$(script_cmdline)"
    if [[ -n "${script}" && ! -x /tmp/startup_script ]]; then
        if [[ "${script}" =~ ^((http|https|ftp)://) ]]; then
            curl "${script}" --retry-connrefused -s -o /tmp/startup_script >/dev/null
            rt=$?
        else
            cp "${script}" /tmp/startup_script
            rt=$?
        fi
        if [[ ${rt} -eq 0 ]]; then
            chmod +x /tmp/startup_script
            /tmp/startup_script
        fi
    fi
}

if [[ $(tty) == "/dev/tty1" ]]; then
    automated_script
		install_dwm
		install_st
		install_dmenu
fi
