from time import localtime, strftime
# download from http://code.google.com/p/psutil/
import psutil, time, os
from axp209 import AXP209

import thingspeak
channel_id = '252673'
write_key  = '8CFR42NFQWBK3WJC'

axp = AXP209()

def doit(channel):
    cpu_pc = psutil.cpu_percent()
    mem_avail = psutil.virtual_memory().percent
    pmu_temp = axp.internal_temperature

    try:
        response = channel.update({1:cpu_pc, 2:mem_avail, 3:pmu_temp})

        print strftime("%a, %d %b %Y %H:%M:%S", localtime())
	print cpu_pc
        print mem_avail
	print pmu_temp
        #print response
	if pmu_temp > 60:
	    os.system('./CHIPPushover.sh "C.H.I.P. over 60 grdC"')
    except:
        print "connection failed"


#sleep for 60 seconds (api limit of 15 secs)
if __name__ == "__main__":
    channel = thingspeak.Channel(id=channel_id,write_key=write_key)
    while True:
        axp.gpio2_output = True
        doit(channel)
        axp.gpio2_output = False
        time.sleep(60)
