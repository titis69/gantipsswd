#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY����  =߀ }� � >���@ݡT �CF�F@4 h`��Ti��4    `44h�d@�I!FiO�e=M�!46��ɓz�<|��V���E%�R�y������W��4�X=IUi� �Ĥ�&��84l׍Ԫ*�r�nF�{�4UUUs�^w�0-(lE��B��s��8q�zp=��ݿ�'����"dN�y�O\r�o0�/���P�Q �8"VUU}�d"�8�r�x��&�2ݐʃd���4�Q�Mc�UUU\ t���C(�`FP*�	T�q�U�c-�l��j�p�v��>�+����*�J�QJd3��ț��}���b��L��x�2�uۣU]v��(��;��wN��ij�Zq6��1��vD�f=Ȼ�)����