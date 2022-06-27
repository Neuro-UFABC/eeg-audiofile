from psychopy import visual
from psychopy.hardware import crs
# we need to be rendering to framebuffer
win = visual.Window([1024,768], useFBO=True)
bits = crs.BitsSharp(win, mode = 'mono++', portName='/dev/ttyACM1')
bits.mode = 'color++'

