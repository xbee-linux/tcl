#!/bin/bash
set -e

# src
cacheDir="/root/.xbee/cache/downloads.sourceforge.net/tcl"
artefactPath="${cacheDir}/tcl{{ .pack.version }}-src.tar.gz"
mkdir -p "${cacheDir}"
if [ ! -f "${artefactPath}" ]; then
	wget https://downloads.sourceforge.net/tcl/tcl{{ .pack.version }}-src.tar.gz -O "$artefactPath"
fi
#chown -R {{ .pack.xbeeUser }}:{{ .pack.xbeeGroup }}
tar xf "${artefactPath}" -C /usr/src

# html doc
artefactPath="${cacheDir}/tcl{{ .pack.version }}-html.tar.gz"
if [ ! -f "${artefactPath}" ]; then
	wget https://downloads.sourceforge.net/tcl/tcl{{ .pack.version }}-html.tar.gz -O "$artefactPath"
fi
tar xf "${artefactPath}" -C /usr/src/tcl{{ .pack.version }} --strip-components=1
