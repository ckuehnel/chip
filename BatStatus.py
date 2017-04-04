#!/usr/bin/env python

# Get battery status for LiPo sourcing C.H.I.P.
# https://pypi.python.org/pypi/axp209/0.0.2

from axp209 import AXP209

axp = AXP209()

print("internal_temperature: %.2fC" % axp.internal_temperature)
print("battery_exists: %s" % axp.battery_exists)
print("battery_charging: %s" % ("charging" if axp.battery_charging else "done"))
print("battery_current_direction: %s" % ("charging" if axp.battery_current_direction else "discharging"))
print("battery_voltage: %.1fmV" % axp.battery_voltage)
print("battery_discharge_current: %.1fmA" % axp.battery_discharge_current)
print("battery_charge_current: %.1fmA" % axp.battery_charge_current)
print("battery_gauge: %d%%" % axp.battery_gauge)
axp.close()

