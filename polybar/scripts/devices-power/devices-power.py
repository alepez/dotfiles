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
        return 0
    return int(percentage[:-1])


def to_string(labels, device):
    labels = dict(labels)
    name = get_name(device)
    percentage = get_battery_percentage(device)

    if name in labels:
        name = labels[name]

    return "{} {}%".format(name, percentage)


def get_label(name):
    arr = name.split(':')
    if len(arr) == 2:
        return (arr[1], arr[0])
    else:
        return (arr[0], arr[0])



proc = subprocess.Popen(['upower', '-d'],
                        stdout=subprocess.PIPE,
                        )
selected_devices = sys.argv[1:]
devices = parse_devices(proc.stdout)

if selected_devices:
    labels = list(map(get_label, selected_devices))
    selected_devices = list(map(lambda x: x[0], labels))
    devices = filter(lambda device: get_name(device) in selected_devices, devices)

print(" | ".join(map(lambda device: to_string(labels, device), devices)))
