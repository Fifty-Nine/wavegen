New-Item .\seeedstudio -type directory -Force
New-Item .\seeedstudio\wavegen-r3 -type directory -Force

# Top layers
Copy-Item .\rev3-F.Cu.gtl .\seeedstudio\wavegen-r3\wavegen-r3.GTL
Copy-Item .\rev3-F.Mask.gts .\seeedstudio\wavegen-r3\wavegen-r3.GTS
Copy-Item .\rev3-F.SilkS.gto .\seeedstudio\wavegen-r3\wavegen-r3.GTO

# Bottom layers
Copy-Item .\rev3-B.Cu.gbl .\seeedstudio\wavegen-r3\wavegen-r3.GBL
Copy-Item .\rev3-B.Mask.gbs .\seeedstudio\wavegen-r3\wavegen-r3.GBS
Copy-Item .\rev3-B.SilkS.gbo .\seeedstudio\wavegen-r3\wavegen-r3.GBO

# Edge cuts
Copy-Item .\rev3-Edge.Cuts.gm1 .\seeedstudio\wavegen-r3\wavegen-r3.GML

# Drills
Copy-Item .\rev3.drl .\seeedstudio\wavegen-r3\wavegen-r3.TXT

# Inner Layers
Copy-Item .\rev3-In1.Cu.g2 .\seeedstudio\wavegen-r3\wavegen-r3.GL2
Copy-Item .\rev3-In2.Cu.g3 .\seeedstudio\wavegen-r3\wavegen-r3.GL3