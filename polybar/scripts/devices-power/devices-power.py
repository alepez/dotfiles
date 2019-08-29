#!/usr/bin/env python3

import sys
import subprocess


def is_blank(s):
    return not s.strip()


def parse_device(stream, device_id):
    device = {'id': device_id}
    for l in stream:
        l = l.decode("utf-8")
        if is_blank(l):
            return device
        colon = l.find(':')
        if colon != -1:
            key = l[0:colon].strip()
            value = l[colon+1:].strip()
            device[key] = value


def parse_devices(stream):
    devices = []
    current_device = {}

    for l in stream:
        l = l.decode("utf-8")
        if l.startswith("Device"):
            device_id = l[l.rfind('/') + 1:len(l)-1]
            current_device = parse_device(stream, device_id)
            devices.append(current_device)

    return devices


def get_field_or_fallback(device, fields):
    for field in fields:
        if field in device:
            return device[field]
    return None


def get_name(device):
    return get_field_or_fallback(device, ['model', 'id'])


def get_battery_percentage(device):
    percentage = get_field_or_fallback(device, ['percentage'])
    if percentage is None:
        return None
    return int(percentage[:-1])


def to_string(device):
    name = get_name(device)
    percentage = get_battery_percentage(device)
    return "{} {}%".format(name, percentage)


proc = subprocess.Popen(['upower', '-d'],
                        stdout=subprocess.PIPE,
                        )
selected_devices = sys.argv[1:]
devices = parse_devices(proc.stdout)
devices = filter(lambda device: get_name(device) in selected_devices, devices)

for device in devices:
    print(to_string(device))

