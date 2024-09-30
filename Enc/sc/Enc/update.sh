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
BZh91AY&SYL!<  ���EP���onޮ����    P.���z{���)O5F�4<�LF��������Cjd�!���	�����j4h�4�� h@Hd��Ojd�40L�S&�d���220 H�ʙ��zL��F2M�� 10C F���!�6)���54   �h2�@o�0��MQD����KZ�H�O��c)W��$�h�)���})��Uf�oeTu�}p����7��<b�b��D�R�� � �C�j "�@�~N��kR��7Yk�9�Zy�:�^U��G9�^t.,p^�p���>�4������e�Œ���{����g��7"Cl+�� R4�� )XBp��FQ�/��#}v�b��[t^�um�=}a�u*��ӂ� ^�݆%����meDz��7�̚�h7�m&�yM!6��|\�E�LmZx�����=����A]Eb�,�k�ۙf�9v�\��Q �EFW��5;0Ӹ�O�4����k$Y	Y	��1�Ѝ���~CU�0ЛIw�ZD��L����µ�«�'>uZ� F2�wU��'�X����^ҁMr[�K���`+�0$�+�`����i�����A�\�]<��jf�jL�U�y�r��*h`B�EF��!�&��@P>�uW_�`'�1�,�ql��Պ��w@�H�^m��>��e!0�g���oȦJ	�҄:�O���	 #`U���g�Y� ���,2�W�M��$�;�
[*5a� ��i�Q@:Mq4b�;��f��u8^�`75*	[#�ml�V��ˁ�"ä��r��CfQ�-��</��U��rJ��,��}�1�,����bZ}Ę����$ F^L�
��cB�Y-t[q��J̷����Mn�S��?���^U���ܑN$ SO 