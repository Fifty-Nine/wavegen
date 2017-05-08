import sys
import math
import PySide
import pywavegen
from pywavegen import output_waveform as ow
from PySide.QtGui import (QApplication, QMainWindow)

from pywavegen_gui_uic import Ui_MainWindow

class MainWindow(QMainWindow, Ui_MainWindow):
  def __init__(self, parent=None):
    super(MainWindow, self).__init__(parent)
    self.setupUi(self)
    self.populateWaveforms(self.ch1WaveformComboBox)
    self.populateWaveforms(self.ch2WaveformComboBox)

    self.channelMap = {
        self.ch1RadioButton : 0,
        self.ch2RadioButton : 1,
        self.ch1FrequencySlider : 0,
        self.ch2FrequencySlider : 1,
        self.ch1FrequencySpinBox : 0,
        self.ch2FrequencySpinBox : 1,
        self.ch1WaveformComboBox : 0,
        self.ch2WaveformComboBox : 1
    }

    self.sliders = {
        0 : self.ch1FrequencySlider,
        1 : self.ch2FrequencySlider
    }
    self.spinBoxes = {
        0 : self.ch1FrequencySpinBox,
        1 : self.ch2FrequencySpinBox
    }

    self.waveforms = {
        0 : self.ch1WaveformComboBox,
        1 : self.ch2WaveformComboBox
    }

    for slider in self.sliders.values():
      slider.valueChanged.connect(self.onSliderChanged)

    for spinBox in self.spinBoxes.values():
      spinBox.valueChanged.connect(self.onSpinBoxChanged)

    for comboBox in self.waveforms.values():
      comboBox.currentIndexChanged.connect(self.setOutput)

    self.ch1RadioButton.toggled.connect(self.onChannelChanged)
    self.ch2RadioButton.toggled.connect(self.onChannelChanged)

    self.device = None

    self.deviceComboBox.currentIndexChanged.connect(self.onDeviceChanged)
    self.deviceComboBox.addItems(pywavegen.enumerate_devices())

  def onDeviceChanged(self):
    print 'onDeviceChanged'

    self.device = None

    serial = str(self.deviceComboBox.currentText())

    print serial

    if len(serial) == 0:
      return

    try:
      self.device = pywavegen.device(serial)
      self.initGui()
    except RuntimeError as e:
      self.device = None
      self.ch1GroupBox.setEnabled(False)
      self.ch2GroupBox.setEnabled(False)

  def initGui(self):
    print 'initGui'
    self.ch1FrequencySlider.setValue(0)
    self.ch2FrequencySlider.setValue(0)
    self.ch1WaveformComboBox.setCurrentIndex(0)
    self.ch2WaveformComboBox.setCurrentIndex(0)
    self.ch1GroupBox.setEnabled(True)
    self.ch2GroupBox.setEnabled(True)
    self.ch1RadioButton.setChecked(True)

  def populateWaveforms(self, box):
    print 'populateWaveforms'
    box.clear()
    box.addItem("Sinusoid", ow.sinusoid)
    box.addItem("Triangle", ow.triangle)
    box.addItem("Square", ow.square)

  def getWaveform(self, channel):
    box = self.waveforms[channel]
    return ow(box.itemData(box.currentIndex()))


  def setFrequency(self, channel, frequency):
    slider = self.sliders[channel]
    spinBox = self.spinBoxes[channel]

    slider.blockSignals(True)
    spinBox.blockSignals(True)

    logFreq = round(math.log10(frequency) * 100 / 6) if frequency != 0 else -1

    slider.setValue(logFreq)
    spinBox.setValue(frequency)

    self.device.set_frequency(channel, frequency)
    
    slider.blockSignals(False)
    spinBox.blockSignals(False)

  def setOutput(self):
    channel = 0 if self.ch1RadioButton.isChecked() else 1
    self.device.set_output(channel, self.getWaveform(channel))
    
  def onSliderChanged(self, value):
    channel = self.channelMap[self.sender()]
    expValue = int(round(10**(6.0 * value / 100.0))) if value != -1 else 0
    self.setFrequency(channel, expValue)
    print value, expValue, self.sliders[channel].value()

  def onSpinBoxChanged(self, value):
    channel = self.channelMap[self.sender()]
    self.setFrequency(channel, value)
    
  def onChannelChanged(self, checked):
    if not checked:
      return
    self.setOutput()


  
if __name__ == '__main__':
  app = QApplication(sys.argv)
  frame = MainWindow()
  frame.show()
  sys.exit(app.exec_())

