#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.wait 50
/bin/echo -n .
$cli set repeat.initial_wait 200
/bin/echo -n .
$cli set remap.jis_unify_kana_eisuu_to_commandR 1
/bin/echo -n .
/bin/echo
