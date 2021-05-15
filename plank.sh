#/bin/bash
SERVICE_CLASH='clash'
#SERVICE_PLANK='plank'
if ps ax | grep -v grep | grep $SERVICE_CLASH > /dev/null
then
	echo "$SERVICE_CLASH is running"
else
	/home/d9/1self/Pentester_tools/Socks_proxy/clash_used/clash &
fi

#if ps ax | grep -v grep | grep $SERVICE_PLANK > /dev/null
#then
#        echo "$SERVICE_PLANK is running"
#else
#        plank &
#fi

