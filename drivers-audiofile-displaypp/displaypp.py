import serial

class DisplayPP:
    def __init__(self):
        self.serial = serial.Serial('/dev/ttyACM1')

    def bipe(self, freq, dur):
        cmd = f'$Beep=[{freq},{dur}]'
        self.send_cmd(cmd)

    def send_cmd(self, cmd):
        c = cmd + '\r'
        out = self.serial.write(c.encode())
        #print(self.serial.read(out))
        print(self.serial.read_all().decode())


d = DisplayPP()
d.bipe(1000,2)
#d.ser.close()
