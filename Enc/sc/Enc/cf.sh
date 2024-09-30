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
BZh91AY&SY��F  ���0 @}������~����PoP@$�F���Ti�&���zM 0�jd���0�2442F�CM 12��&������F�FL�a �s	�#CC!�hd4Ѡ� @0	$�4���i��D���5=OH����S��jJ ��,�b�]dX|�޿�4P�0��q�%Lo�UM �=2��>|���p��B�M/���RC�P�B|b'��N��U��ڠ�ga�\��F���e��"�ߨ��0�sn2!���/�$��с��z��3DR~ �r�(�<��G=�b-��Ә���1��#!{y��\���H7dxР�(h���M�QBi��4G��xA���r�~��K�E�KܡLZ#g��Z:!Ճ��US5J�p�F<�-�������U��W)��gz��t�zGx�[�(��d���`��s����>�� �P<�:�sb�v�H�Y�>A;���w�<<��g��}Š���y򍖲7m�� AVN �Kq���vʈ���fx��o~����mU��޲D$	 2�({���Ы��w����Z��6\��sj�|�e�V$�õ%�������D��Få��¬z����a�ݖ�JZ��K�䃱�~�X$����lPf�N���_�2̷NoQ���>#�F| 4I?8�����i���x����d|�ǙDz+�N�8*d��]+�̘N4s��4]C3��2���4$9�B ��%^LS��Lp�2��l�r=VtfJFj�����7s��h���p�£	A?k{�����֦�e�Y��Ӂ�_�"6��^�9���T��8T^���	��W �$n�`�cx$⍌P�*pҊ)�� �����R@ۺ����\��}d;E ��2{�Ǐ!�����ܑN$3>D��