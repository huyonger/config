#!/bin/sh
#注释:clashX启动,添加http_proxy;clashX关闭,清除http_proxy

LOG_FILE=/var/log/supervisor_clashx.log
function log() { 
  local t=$(date +"%F %X") 
  echo "[ $t ] $0 : $1 " >> ${LOG_FILE} 
} 

function check_process() { 
  if [ -z $1 ]; then 
    log "Input parameter is empty." 
    return 0    
  fi 
   
  p_num=$(ps -e | grep "$1" | grep -v "grep" | wc -l) 
  echo $p_num 
} 

declare -i ch_num 
p_name="ClashX" 
ch_num=$(check_process $p_name) 
sed -i "" "/export http.*/d" ~/.zshrc
echo 
if [ $ch_num -eq 0 ]; then 
    log "$p_name has stopped"
else
    log "$p_name is running"
    echo "export http_proxy=http://127.0.0.1:7890/" >> ~/.zshrc
    echo "export https_proxy=http://127.0.0.1:7890/" >> ~/.zshrc
fi 
