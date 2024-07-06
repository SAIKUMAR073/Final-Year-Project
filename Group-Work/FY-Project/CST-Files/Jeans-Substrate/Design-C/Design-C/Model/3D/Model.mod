'# MWS Version: Version 2019.0 - Sep 20 2018 - ACIS 28.0.2 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 1 fmax = 5
'# created = '[VERSION]2019.0|28.0.2|20180920[/VERSION]


'@ use template: Design_A.cfg

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
'set the units
With Units
    .Geometry "mm"
    .Frequency "GHz"
    .Voltage "V"
    .Resistance "Ohm"
    .Inductance "H"
    .TemperatureUnit  "Kelvin"
    .Time "ns"
    .Current "A"
    .Conductance "Siemens"
    .Capacitance "F"
End With
'----------------------------------------------------------------------------
Plot.DrawBox True
With Background
     .Type "Normal"
     .Epsilon "1.0"
     .Mu "1.0"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With
With Boundary
     .Xmin "expanded open"
     .Xmax "expanded open"
     .Ymin "expanded open"
     .Ymax "expanded open"
     .Zmin "expanded open"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
End With
' switch on FD-TET setting for accurate farfields
FDSolver.ExtrudeOpenBC "True"
Mesh.FPBAAvoidNonRegUnite "True"
Mesh.ConsiderSpaceForLowerMeshLimit "False"
Mesh.MinimumStepNumber "5"
With MeshSettings
     .SetMeshType "Hex"
     .Set "RatioLimitGeometry", "20"
End With
With MeshSettings
     .SetMeshType "HexTLM"
     .Set "RatioLimitGeometry", "20"
End With
PostProcess1D.ActivateOperation "vswr", "true"
PostProcess1D.ActivateOperation "yz-matrices", "true"
With FarfieldPlot
	.ClearCuts ' lateral=phi, polar=theta
	.AddCut "lateral", "0", "1"
	.AddCut "lateral", "90", "1"
	.AddCut "polar", "90", "1"
End With
'----------------------------------------------------------------------------
With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 1%
End With
With Mesh
     .MeshType "PBA"
End With
'set the solver type
ChangeSolverType("HF Time Domain")
'----------------------------------------------------------------------------

'@ define material: jeans

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Material 
     .Reset 
     .Name "jeans"
     .Folder ""
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .HeatCapacity "0"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "1.78"
     .Mu "1"
     .Sigma "0"
     .TanD "0.085"
     .TanDFreq "0.0"
     .TanDGiven "True"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0", "0", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ new component: component1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.New "component1"

'@ define brick: component1:Substrate_jeans

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Substrate_jeans" 
     .Component "component1" 
     .Material "jeans" 
     .Xrange "-Ws/2", "Ws/2" 
     .Yrange "0", "Ls" 
     .Zrange "0", "-h" 
     .Create
End With

'@ pick face

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickFaceFromId "component1:Substrate_jeans", "2"

'@ define material: Copper (annealed)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Material
     .Reset
     .Name "Copper (annealed)"
     .Folder ""
.FrqType "static"
.Type "Normal"
.SetMaterialUnit "Hz", "mm"
.Epsilon "1"
.Mu "1.0"
.Kappa "5.8e+007"
.TanD "0.0"
.TanDFreq "0.0"
.TanDGiven "False"
.TanDModel "ConstTanD"
.KappaM "0"
.TanDM "0.0"
.TanDMFreq "0.0"
.TanDMGiven "False"
.TanDMModel "ConstTanD"
.DispModelEps "None"
.DispModelMu "None"
.DispersiveFittingSchemeEps "Nth Order"
.DispersiveFittingSchemeMu "Nth Order"
.UseGeneralDispersionEps "False"
.UseGeneralDispersionMu "False"
.FrqType "all"
.Type "Lossy metal"
.SetMaterialUnit "GHz", "mm"
.Mu "1.0"
.Kappa "5.8e+007"
.Rho "8930.0"
.ThermalType "Normal"
.ThermalConductivity "401.0"
.HeatCapacity "0.39"
.MetabolicRate "0"
.BloodFlow "0"
.VoxelConvection "0"
.MechanicsType "Isotropic"
.YoungsModulus "120"
.PoissonsRatio "0.33"
.ThermalExpansionRate "17"
.Colour "1", "1", "0"
.Wireframe "False"
.Reflection "False"
.Allowoutline "True"
.Transparentoutline "False"
.Transparency "0"
.Create
End With

'@ define extrude: component1:Ground_Plane

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Extrude 
     .Reset 
     .Name "Ground_Plane" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Mode "Picks" 
     .Height "t" 
     .Twist "0.0" 
     .Taper "0.0" 
     .UsePicksForHeight "False" 
     .DeleteBaseFaceSolid "False" 
     .ClearPickedFace "True" 
     .Create 
End With

'@ define brick: component1:Microstrip_FeedLine

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Microstrip_FeedLine" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-Wf/2", "Wf/2" 
     .Yrange "0", "Lf" 
     .Zrange "0", "t" 
     .Create
End With

'@ define brick: component1:Microstrip_Patch

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Microstrip_Patch" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-W/2", "W/2" 
     .Yrange "Lf", "Lf+L" 
     .Zrange "0", "t" 
     .Create
End With

'@ pick face

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickFaceFromId "component1:Microstrip_FeedLine", "3"

'@ define port:1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
' Port constructed by macro Solver -> Ports -> Calculate port extension coefficient
With Port
  .Reset
  .PortNumber "1"
  .NumberOfModes "1"
  .AdjustPolarization False
  .PolarizationAngle "0.0"
  .ReferencePlaneDistance "0"
  .TextSize "50"
  .Coordinates "Picks"
  .Orientation "Positive"
  .PortOnBound "True"
  .ClipPickedPortToBound "False"
  .XrangeAdd "0.6*9.34", "0.6*9.34"
  .YrangeAdd "0", "0"
  .ZrangeAdd "0.6", "0.6*9.34"
  .Shield "PEC"
  .SingleEnded "False"
  .Create
End With

'@ define frequency range

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solver.FrequencyRange "1", "5"

'@ define monitor: e-field (f=2.45)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=2.45)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "2.45" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-27.8", "27.8", "0", "71.7", "-0.635", "5.639" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: h-field (f=2.45)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=2.45)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "2.45" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-27.8", "27.8", "0", "71.7", "-0.635", "5.639" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define farfield monitor: farfield (f=2.45)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (f=2.45)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
     .MonitorValue "2.45" 
     .ExportFarfieldSource "False" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-27.8", "27.8", "0", "71.7", "-0.635", "5.639" 
     .SetSubvolumeOffset "10", "10", "10", "10", "10", "10" 
     .SetSubvolumeInflateWithOffset "False" 
     .SetSubvolumeOffsetType "FractionOfWavelength" 
     .Create 
End With

'@ define time domain solver parameters

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-40"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ set PBA version

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Discretizer.PBAVersion "2018092019"

'@ define brick: component1:Patch_Slot_Adj_Feed

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Patch_Slot_Adj_Feed" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-Wf/2-Wps", "-Wf/2" 
     .Yrange "Lf", "Lf+Lps" 
     .Zrange "0", "t" 
     .Create
End With

'@ transform: mirror component1:Patch_Slot_Adj_Feed

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Patch_Slot_Adj_Feed" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Microstrip_Patch, component1:Patch_Slot_Adj_Feed

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_Patch", "component1:Patch_Slot_Adj_Feed"

'@ boolean subtract shapes: component1:Microstrip_Patch, component1:Patch_Slot_Adj_Feed_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_Patch", "component1:Patch_Slot_Adj_Feed_1"

'@ farfield plot options

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "5" 
     .Step2 "5" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Gain" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With

'@ define extrude: component1:Patch_Corner_Extrude

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Extrude 
     .Reset 
     .Name "Patch_Corner_Extrude" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Mode "Pointlist" 
     .Height "t" 
     .Twist "0.0" 
     .Taper "0.0" 
     .Origin "0.0", "0.0", "0.0" 
     .Uvector "1.0", "0.0", "0.0" 
     .Vvector "0.0", "1.0", "0.0" 
     .Point "-W/2", "Lf+L" 
     .LineTo "-W/2", "Lf+L-Lpe" 
     .LineTo "-W/2+Wpe", "Lf+L" 
     .Create 
End With

'@ transform: mirror component1:Patch_Corner_Extrude

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Patch_Corner_Extrude" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean add shapes: component1:Microstrip_FeedLine, component1:Microstrip_Patch

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Add "component1:Microstrip_FeedLine", "component1:Microstrip_Patch"

'@ rename block: component1:Microstrip_FeedLine to: component1:Microstrip_FeedLine_Patch

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Rename "component1:Microstrip_FeedLine", "Microstrip_FeedLine_Patch"

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Patch_Corner_Extrude

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Patch_Corner_Extrude"

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Patch_Corner_Extrude_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Patch_Corner_Extrude_1"

'@ define extrude: component1:Patch_Corner_Extrude_Bott

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Extrude 
     .Reset 
     .Name "Patch_Corner_Extrude_Bott" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Mode "Pointlist" 
     .Height "t" 
     .Twist "0.0" 
     .Taper "0.0" 
     .Origin "0.0", "0.0", "0.0" 
     .Uvector "1.0", "0.0", "0.0" 
     .Vvector "0.0", "1.0", "0.0" 
     .Point "-W/2", "Lf" 
     .LineTo "-W/2", "Lf+Lpe" 
     .LineTo "-W/2+Wpe", "Lf" 
     .Create 
End With

'@ transform: mirror component1:Patch_Corner_Extrude_Bott

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Patch_Corner_Extrude_Bott" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Patch_Corner_Extrude_Bott

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Patch_Corner_Extrude_Bott"

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Patch_Corner_Extrude_Bott_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Patch_Corner_Extrude_Bott_1"

'@ define sphere: component1:Patch_Center_Circle

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Sphere 
     .Reset 
     .Name "Patch_Center_Circle" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Axis "z" 
     .CenterRadius "Rc" 
     .TopRadius "0" 
     .BottomRadius "0" 
     .Center "0", "Lf+L/2", "t" 
     .Segments "0" 
     .Create 
End With

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Patch_Center_Circle

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Patch_Center_Circle"

'@ define brick: component1:Rectangular_Slot_On_Sides

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Rectangular_Slot_On_Sides" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-W/2", "-W/2+Wpsr" 
     .Yrange "Lf+L/2-Lpsr/2", "Lf+L/2+Lpsr/2" 
     .Zrange "0", "t" 
     .Create
End With

'@ transform: mirror component1:Rectangular_Slot_On_Sides

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Rectangular_Slot_On_Sides" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Rectangular_Slot_On_Sides

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Rectangular_Slot_On_Sides"

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Rectangular_Slot_On_Sides_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Rectangular_Slot_On_Sides_1"

'@ define brick: component1:Patch_Top_Slot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Patch_Top_Slot" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-Wf/2", "Wf/2" 
     .Yrange "Lf+L-Lts", "Lf+L" 
     .Zrange "0", "t" 
     .Create
End With

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Patch_Top_Slot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Patch_Top_Slot"

'@ define brick: component1:Top_Slot_Right

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Top_Slot_Right" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "Wf/2+Gts", "Wf/2+Gts+Wf" 
     .Yrange "Lf+L-Lts", "Lf+L" 
     .Zrange "0", "t" 
     .Create
End With

'@ transform: mirror component1:Top_Slot_Right

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Top_Slot_Right" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Top_Slot_Right

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Top_Slot_Right"

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Top_Slot_Right_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Top_Slot_Right_1"

'@ define brick: component1:Patch_Bottom_slotC

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Patch_Bottom_slotC" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-Wf/2-Wps-Wc-Wps/2", "-Wf/2-Wps-Wc+Wps/2" 
     .Yrange "Lf", "Lf+Lps" 
     .Zrange "0", "t" 
     .Create
End With

'@ transform: mirror component1:Patch_Bottom_slotC

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Patch_Bottom_slotC" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Patch_Bottom_slotC

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Patch_Bottom_slotC"

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Patch_Bottom_slotC_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Patch_Bottom_slotC_1"

'@ define brick: component1:Bottom_Patch_slotRightmost

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Bottom_Patch_slotRightmost" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-Wf/2-Wps-Wc1-Wps/2", "-Wf/2-Wps-Wc1+Wps/2" 
     .Yrange "Lf", "Lf+Lps" 
     .Zrange "0", "t" 
     .Create
End With

'@ transform: mirror component1:Bottom_Patch_slotRightmost

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Bottom_Patch_slotRightmost" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ define brick: component1:Bottom_Patch_slot_Leftmost

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Bottom_Patch_slot_Leftmost" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-Wf/2-Wps-Wc-Wps/2-Wc1-Wps/2", "-Wf/2-Wps-Wc-Wps/2-Wc1+Wps/2" 
     .Yrange "Lf", "Lf+Lps" 
     .Zrange "0", "t" 
     .Create
End With

'@ transform: mirror component1:Bottom_Patch_slot_Leftmost

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Bottom_Patch_slot_Leftmost" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Bottom_Patch_slot_Leftmost

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Bottom_Patch_slot_Leftmost"

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Bottom_Patch_slot_Leftmost_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Bottom_Patch_slot_Leftmost_1"

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Bottom_Patch_slotRightmost

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Bottom_Patch_slotRightmost"

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Bottom_Patch_slotRightmost_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Bottom_Patch_slotRightmost_1"

'@ define brick: component1:Top_Small_Slot_Rcenter

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Top_Small_Slot_Rcenter" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "Wf/2+Gts+Wf+Wct-Wps/2", "Wf/2+Gts+Wf+Wct+Wps/2" 
     .Yrange "Lf+L-Lps", "Lf+L" 
     .Zrange "0", "t" 
     .Create
End With

'@ transform: mirror component1:Top_Small_Slot_Rcenter

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Top_Small_Slot_Rcenter" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Top_Small_Slot_Rcenter

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Top_Small_Slot_Rcenter"

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Top_Small_Slot_Rcenter_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Top_Small_Slot_Rcenter_1"

'@ define brick: component1:Top_Smal_Slot_RR

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Top_Smal_Slot_RR" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "Wf/2+Gts+Wf+Wct+Wps/2+Wct1-Wps/2", "Wf/2+Gts+Wf+Wct+Wps/2+Wct1+Wps/2" 
     .Yrange "Lf+L-Lps", "Lf+L" 
     .Zrange "0", "t" 
     .Create
End With

'@ define brick: component1:Top_Small_Slot_RL

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Top_Small_Slot_RL" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "Wf/2+Gts+Wf+Wct-Wps/2-Wct1-Wps/2", "Wf/2+Gts+Wf+Wct-Wps/2-Wct1+Wps/2" 
     .Yrange "Lf+L-Lps", "Lf+L" 
     .Zrange "0", "t" 
     .Create
End With

'@ transform: mirror component1:Top_Small_Slot_RL

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Top_Small_Slot_RL" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ transform: mirror component1:Top_Smal_Slot_RR

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Top_Smal_Slot_RR" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Top_Smal_Slot_RR

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Top_Smal_Slot_RR"

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Top_Smal_Slot_RR_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Top_Smal_Slot_RR_1"

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Top_Small_Slot_RL

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Top_Small_Slot_RL"

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Top_Small_Slot_RL_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Top_Small_Slot_RL_1"

''@ define sphere: component1:Circle_Slot_Below_big_Circle
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Sphere 
'     .Reset 
'     .Name "Circle_Slot_Below_big_Circle" 
'     .Component "component1" 
'     .Material "Copper (annealed)" 
'     .Axis "z" 
'     .CenterRadius "Rsc" 
'     .TopRadius "0" 
'     .BottomRadius "0" 
'     .Center "0", "Lf+L/2-Lpsr/2-Lc-2", "t" 
'     .Segments "0" 
'     .Create 
'End With
'
''@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Circle_Slot_Below_big_Circle
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Circle_Slot_Below_big_Circle"
'
'@ define sphere: component1:Circle_Below_RightRectSlot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Sphere 
     .Reset 
     .Name "Circle_Below_RightRectSlot" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Axis "z" 
     .CenterRadius "Rsc" 
     .TopRadius "0" 
     .BottomRadius "0" 
     .Center "W/2-Lc", "Lf+L/2-Lpsr/2-Lc", "t" 
     .Segments "0" 
     .Create 
End With

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Circle_Below_RightRectSlot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Circle_Below_RightRectSlot"

'@ define sphere: component1:Circle_Bottom_Left

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Sphere 
     .Reset 
     .Name "Circle_Bottom_Left" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Axis "z" 
     .CenterRadius "Rsc" 
     .TopRadius "0" 
     .BottomRadius "0" 
     .Center "-W/2+Lc", "Lf+L/2-Lpsr/2-Lc", "t" 
     .Segments "0" 
     .Create 
End With

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Circle_Bottom_Left

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Circle_Bottom_Left"

'@ define sphere: component1:Circle_Above_LeftRectSlot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Sphere 
     .Reset 
     .Name "Circle_Above_LeftRectSlot" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Axis "z" 
     .CenterRadius "Rsc" 
     .TopRadius "0" 
     .BottomRadius "0" 
     .Center "-W/2+Lc", "Lf+L/2+Lpsr/2+Lc", "t" 
     .Segments "0" 
     .Create 
End With

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Circle_Above_LeftRectSlot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Circle_Above_LeftRectSlot"

'@ define sphere: component1:Circle_Slot_Above_RightRectSlot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Sphere 
     .Reset 
     .Name "Circle_Slot_Above_RightRectSlot" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Axis "z" 
     .CenterRadius "Rsc" 
     .TopRadius "0" 
     .BottomRadius "0" 
     .Center "W/2-Lc", "Lf+L/2+Lpsr/2+Lc", "t" 
     .Segments "0" 
     .Create 
End With

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Circle_Slot_Above_RightRectSlot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Circle_Slot_Above_RightRectSlot"

''@ define sphere: component1:Circle_Above_BigCircle
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Sphere 
'     .Reset 
'     .Name "Circle_Above_BigCircle" 
'     .Component "component1" 
'     .Material "Copper (annealed)" 
'     .Axis "z" 
'     .CenterRadius "Rsc" 
'     .TopRadius "0" 
'     .BottomRadius "0" 
'     .Center "0", "Lf+L/2+Lpsr/2+Lc+2", "t" 
'     .Segments "0" 
'     .Create 
'End With
'
''@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Circle_Above_BigCircle
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Circle_Above_BigCircle"
'
'@ define brick: component1:Rectangular_Slot_Bottom

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Rectangular_Slot_Bottom" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-W/2+Wpe", "W/2-Wpe" 
     .Yrange "Lf+Lpe", "Lf+Lpe+Lbr" 
     .Zrange "0", "t" 
     .Create
End With

'@ define brick: component1:Ver_Bottom_Rect_Slot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Ver_Bottom_Rect_Slot" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-W/2+Wpe-Wvre", "-W/2+Wpe" 
     .Yrange "Lf+Lpe", "Lf+Lpe+Lvre" 
     .Zrange "0", "t" 
     .Create
End With

'@ transform: mirror component1:Ver_Bottom_Rect_Slot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Ver_Bottom_Rect_Slot" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Rectangular_Slot_Bottom

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Rectangular_Slot_Bottom"

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Ver_Bottom_Rect_Slot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Ver_Bottom_Rect_Slot"

'@ boolean subtract shapes: component1:Microstrip_FeedLine_Patch, component1:Ver_Bottom_Rect_Slot_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Microstrip_FeedLine_Patch", "component1:Ver_Bottom_Rect_Slot_1"

'@ farfield plot options

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle2" 
     .Theta "90" 
     .Phi "90" 
     .Step "5" 
     .Step2 "5" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Gain" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .SetMaxReferenceMode "abs" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .ClearCuts 
     .AddCut "lateral", "0", "1"  
     .AddCut "lateral", "90", "1"  
     .AddCut "polar", "90", "1"  
     .StoreSettings
End With

''@ define brick: component1:Brick_Above_Patch
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Brick
'     .Reset 
'     .Name "Brick_Above_Patch" 
'     .Component "component1" 
'     .Material "Copper (annealed)" 
'     .Xrange "-W/2+Gr", "W/2-Gr" 
'     .Yrange "Lf+L+Gp", "Lf+L+Gp+Lr" 
'     .Zrange "0", "t" 
'     .Create
'End With
'
''@ define brick: component1:Brick_Above_Patch_Ver
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Brick
'     .Reset 
'     .Name "Brick_Above_Patch_Ver" 
'     .Component "component1" 
'     .Material "Copper (annealed)" 
'     .Xrange "W/2", "W/2+Lr" 
'     .Yrange "Lf+L+Gp+Lr-Lv", "Lf+L+Gp+Lr" 
'     .Zrange "0", "t" 
'     .Create
'End With
'
''@ transform: mirror component1:Brick_Above_Patch_Ver
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Transform 
'     .Reset 
'     .Name "component1:Brick_Above_Patch_Ver" 
'     .Origin "Free" 
'     .Center "0", "0", "0" 
'     .PlaneNormal "1", "0", "0" 
'     .MultipleObjects "True" 
'     .GroupObjects "False" 
'     .Repetitions "1" 
'     .MultipleSelection "False" 
'     .Destination "" 
'     .Material "" 
'     .Transform "Shape", "Mirror" 
'End With
'
''@ boolean add shapes: component1:Brick_Above_Patch, component1:Brick_Above_Patch_Ver
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'Solid.Add "component1:Brick_Above_Patch", "component1:Brick_Above_Patch_Ver"
'
''@ boolean add shapes: component1:Brick_Above_Patch, component1:Brick_Above_Patch_Ver_1
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'Solid.Add "component1:Brick_Above_Patch", "component1:Brick_Above_Patch_Ver_1"
'
''@ define brick: component1:Brick_directive
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Brick
'     .Reset 
'     .Name "Brick_directive" 
'     .Component "component1" 
'     .Material "Copper (annealed)" 
'     .Xrange "Wf/2+ Wg", "Ws/2-Wg2" 
'     .Yrange "0", "L1" 
'     .Zrange "0", "t" 
'     .Create
'End With
'
''@ transform: mirror component1:Brick_directive
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Transform 
'     .Reset 
'     .Name "component1:Brick_directive" 
'     .Origin "Free" 
'     .Center "0", "0", "0" 
'     .PlaneNormal "1", "0", "0" 
'     .MultipleObjects "True" 
'     .GroupObjects "False" 
'     .Repetitions "1" 
'     .MultipleSelection "False" 
'     .Destination "" 
'     .Material "" 
'     .Transform "Shape", "Mirror" 
'End With
'
'@ define brick: component1:GroundPlane

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "GroundPlane" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "Wf/2", "Ws/2" 
     .Yrange "0", "Lf" 
     .Zrange "-h", "-h-t" 
     .Create
End With

'@ rename block: component1:GroundPlane to: component1:GroundPlane_Slot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Rename "component1:GroundPlane", "GroundPlane_Slot"

'@ transform: mirror component1:GroundPlane_Slot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:GroundPlane_Slot" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Ground_Plane, component1:GroundPlane_Slot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:GroundPlane_Slot"

'@ boolean subtract shapes: component1:Ground_Plane, component1:GroundPlane_Slot_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:GroundPlane_Slot_1"

''@ define brick: component1:Brick_On_Side
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Brick
'     .Reset 
'     .Name "Brick_On_Side" 
'     .Component "component1" 
'     .Material "Copper (annealed)" 
'     .Xrange "-Ws/2+Gr", "-Ws/2+Gr+Lr" 
'     .Yrange "Lf", "Lf+L" 
'     .Zrange "0", "t" 
'     .Create
'End With
'
''@ define brick: component1:solid1
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Brick
'     .Reset 
'     .Name "solid1" 
'     .Component "component1" 
'     .Material "Copper (annealed)" 
'     .Xrange "-Ws/2+Gr", "-Ws/2+Gr+Lv" 
'     .Yrange "Lf+L", "Lf+L+Lr" 
'     .Zrange "0", "t" 
'     .Create
'End With
'
''@ rename block: component1:solid1 to: component1:Brick_on_side_small
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'Solid.Rename "component1:solid1", "Brick_on_side_small"
'
''@ transform: mirror component1:Brick_on_side_small
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Transform 
'     .Reset 
'     .Name "component1:Brick_on_side_small" 
'     .Origin "Free" 
'     .Center "0", "Lf+L/2", "0" 
'     .PlaneNormal "0", "1", "0" 
'     .MultipleObjects "True" 
'     .GroupObjects "False" 
'     .Repetitions "1" 
'     .MultipleSelection "False" 
'     .Destination "" 
'     .Material "" 
'     .Transform "Shape", "Mirror" 
'End With
'
''@ boolean add shapes: component1:Brick_On_Side, component1:Brick_on_side_small
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'Solid.Add "component1:Brick_On_Side", "component1:Brick_on_side_small"
'
''@ boolean add shapes: component1:Brick_On_Side, component1:Brick_on_side_small_1
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'Solid.Add "component1:Brick_On_Side", "component1:Brick_on_side_small_1"
'
''@ transform: mirror component1:Brick_On_Side
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Transform 
'     .Reset 
'     .Name "component1:Brick_On_Side" 
'     .Origin "Free" 
'     .Center "0", "0", "0" 
'     .PlaneNormal "1", "0", "0" 
'     .MultipleObjects "True" 
'     .GroupObjects "False" 
'     .Repetitions "1" 
'     .MultipleSelection "False" 
'     .Destination "" 
'     .Material "" 
'     .Transform "Shape", "Mirror" 
'End With
'
''@ define brick: component1:Ground_Plane_Cut
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Brick
'     .Reset 
'     .Name "Ground_Plane_Cut" 
'     .Component "component1" 
'     .Material "Copper (annealed)" 
'     .Xrange "-Ws/2", "Ws/2" 
'     .Yrange "Ls-Lgc", "Ls" 
'     .Zrange "-h", "-h-t" 
'     .Create
'End With
'
''@ boolean subtract shapes: component1:Ground_Plane, component1:Ground_Plane_Cut
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'Solid.Subtract "component1:Ground_Plane", "component1:Ground_Plane_Cut"
'
''@ define extrude: component1:Ground_Extrude
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Extrude 
'     .Reset 
'     .Name "Ground_Extrude" 
'     .Component "component1" 
'     .Material "Copper (annealed)" 
'     .Mode "Pointlist" 
'     .Height "-h-t" 
'     .Twist "0.0" 
'     .Taper "0.0" 
'     .Origin "0.0", "0.0", "-h" 
'     .Uvector "1.0", "0.0", "0.0" 
'     .Vvector "0.0", "1.0", "0.0" 
'     .Point "Ws/2", "Ls-Lgc" 
'     .LineTo "Ws/2-Wpe", "Ls-Lgc" 
'     .LineTo "Ws/2", "Ls-Lgc-Lpe" 
'     .Create 
'End With
'
''@ transform: mirror component1:Ground_Extrude
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Transform 
'     .Reset 
'     .Name "component1:Ground_Extrude" 
'     .Origin "Free" 
'     .Center "0", "0", "0" 
'     .PlaneNormal "1", "0", "0" 
'     .MultipleObjects "True" 
'     .GroupObjects "False" 
'     .Repetitions "1" 
'     .MultipleSelection "False" 
'     .Destination "" 
'     .Material "" 
'     .Transform "Shape", "Mirror" 
'End With
'
''@ boolean subtract shapes: component1:Ground_Plane, component1:Ground_Extrude
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'Solid.Subtract "component1:Ground_Plane", "component1:Ground_Extrude"
'
''@ boolean subtract shapes: component1:Ground_Plane, component1:Ground_Extrude_1
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'Solid.Subtract "component1:Ground_Plane", "component1:Ground_Extrude_1"
'
'@ define material: jeans

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Material 
     .Reset 
     .Name "jeans"
     .Folder ""
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .HeatCapacity "0"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "Er"
     .Mu "1"
     .Sigma "0.0"
     .TanD "LT"
     .TanDFreq "0.0"
     .TanDGiven "True"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0", "0", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ define material colour: jeans

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Material 
     .Name "jeans"
     .Folder ""
     .Colour "0", "0", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeColour 
End With

'@ define brick: component1:Ground_BottomVerSlot_Adj_Feed

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Ground_BottomVerSlot_Adj_Feed" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "Wf/2+Gg", "Wf/2+Gg+W1" 
     .Yrange "Lf", "Lf+Lg" 
     .Zrange "-h", "-h-t" 
     .Create
End With

'@ transform: mirror component1:Ground_BottomVerSlot_Adj_Feed

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Ground_BottomVerSlot_Adj_Feed" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Ground_Plane, component1:Ground_BottomVerSlot_Adj_Feed

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:Ground_BottomVerSlot_Adj_Feed"

'@ boolean subtract shapes: component1:Ground_Plane, component1:Ground_BottomVerSlot_Adj_Feed_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:Ground_BottomVerSlot_Adj_Feed_1"

'@ define brick: component1:GroundPlane_LargeCut_Bottom

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "GroundPlane_LargeCut_Bottom" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "Wf/2+W1+Gd", "Ws/2" 
     .Yrange "Lf", "Lf+Lg" 
     .Zrange "-h", "-h-t" 
     .Create
End With

'@ transform: mirror component1:GroundPlane_LargeCut_Bottom

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:GroundPlane_LargeCut_Bottom" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Ground_Plane, component1:GroundPlane_LargeCut_Bottom

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:GroundPlane_LargeCut_Bottom"

'@ boolean subtract shapes: component1:Ground_Plane, component1:GroundPlane_LargeCut_Bottom_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:GroundPlane_LargeCut_Bottom_1"

''@ define extrude: component1:Extrude_GPlane_Bottom
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Extrude 
'     .Reset 
'     .Name "Extrude_GPlane_Bottom" 
'     .Component "component1" 
'     .Material "Copper (annealed)" 
'     .Mode "Pointlist" 
'     .Height "t" 
'     .Twist "0.0" 
'     .Taper "0.0" 
'     .Origin "0.0", "0.0", "-h-t" 
'     .Uvector "1.0", "0.0", "0.0" 
'     .Vvector "0.0", "1.0", "0.0" 
'     .Point "Ws/2", "Lf+Lg" 
'     .LineTo "Ws/2", "Lf+Lg+Lpe" 
'     .LineTo "Ws/2-Wpe", "Lf+Lg" 
'     .Create 
'End With
'
''@ transform: mirror component1:Extrude_GPlane_Bottom
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Transform 
'     .Reset 
'     .Name "component1:Extrude_GPlane_Bottom" 
'     .Origin "Free" 
'     .Center "0", "0", "0" 
'     .PlaneNormal "1", "0", "0" 
'     .MultipleObjects "True" 
'     .GroupObjects "False" 
'     .Repetitions "1" 
'     .MultipleSelection "False" 
'     .Destination "" 
'     .Material "" 
'     .Transform "Shape", "Mirror" 
'End With
'
''@ boolean subtract shapes: component1:Ground_Plane, component1:Extrude_GPlane_Bottom
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'Solid.Subtract "component1:Ground_Plane", "component1:Extrude_GPlane_Bottom"
'
''@ boolean subtract shapes: component1:Ground_Plane, component1:Extrude_GPlane_Bottom_1
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'Solid.Subtract "component1:Ground_Plane", "component1:Extrude_GPlane_Bottom_1"
'
'@ define brick: component1:Ground Cut_Bottt

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Ground Cut_Bottt" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "Ws/2-Gap1-W2", "Ws/2-Gap1" 
     .Yrange "Lf+Lg", "Lf+Lg+L3" 
     .Zrange "-h", "-h-t" 
     .Create
End With

'@ transform: mirror component1:Ground Cut_Bottt

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Ground Cut_Bottt" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Ground_Plane, component1:Ground Cut_Bottt

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:Ground Cut_Bottt"

'@ boolean subtract shapes: component1:Ground_Plane, component1:Ground Cut_Bottt_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:Ground Cut_Bottt_1"

''@ define brick: component1:Ground_Plane_Cut_On_G
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Brick
'     .Reset 
'     .Name "Ground_Plane_Cut_On_G" 
'     .Component "component1" 
'     .Material "Copper (annealed)" 
'     .Xrange "-Wf/2-Wog", "Wf/2+Wog" 
'     .Yrange "Lf+L3+Lg", "Lf+L3+Lg+L4" 
'     .Zrange "-h", "-h-t" 
'     .Create
'End With
'
''@ boolean subtract shapes: component1:Ground_Plane, component1:Ground_Plane_Cut_On_G
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'Solid.Subtract "component1:Ground_Plane", "component1:Ground_Plane_Cut_On_G"
'
'@ define brick: component1:Some_Copper

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Some_Copper" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-Wf/2-Gg", "Wf/2+Gg" 
     .Yrange "Lf+Lg", "Lf+Lg+L5" 
     .Zrange "-h", "-h-t" 
     .Create
End With

'@ boolean add shapes: component1:Ground_Plane, component1:Some_Copper

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Add "component1:Ground_Plane", "component1:Some_Copper"

'@ define brick: component1:Slot-Ground_Right_small

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Slot-Ground_Right_small" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "Ws/2-Wgc3-Sw/2", "Ws/2-Wgc3+Sw/2" 
     .Yrange "Lf+Lg", "Lf+Lg+Sl" 
     .Zrange "-h", "-h-t" 
     .Create
End With

'@ transform: mirror component1:Slot-Ground_Right_small

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Slot-Ground_Right_small" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Ground_Plane, component1:Slot-Ground_Right_small

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:Slot-Ground_Right_small"

'@ boolean subtract shapes: component1:Ground_Plane, component1:Slot-Ground_Right_small_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:Slot-Ground_Right_small_1"

'@ define brick: component1:On_G_Plane-Rect_Slot_ONsides

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "On_G_Plane-Rect_Slot_ONsides" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "Ws/2-Wrog", "Ws/2" 
     .Yrange "Ls-Lgm-Lrog/2", "Ls-Lgm+Lrog/2" 
     .Zrange "-h", "-h-t" 
     .Create
End With

'@ transform: mirror component1:On_G_Plane-Rect_Slot_ONsides

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:On_G_Plane-Rect_Slot_ONsides" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Ground_Plane, component1:On_G_Plane-Rect_Slot_ONsides

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:On_G_Plane-Rect_Slot_ONsides"

'@ boolean subtract shapes: component1:Ground_Plane, component1:On_G_Plane-Rect_Slot_ONsides_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:On_G_Plane-Rect_Slot_ONsides_1"

''@ define brick: component1:Slot_On_Ground_Above
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Brick
'     .Reset 
'     .Name "Slot_On_Ground_Above" 
'     .Component "component1" 
'     .Material "Copper (annealed)" 
'     .Xrange "Wf/2", "Wf/2+Wus" 
'     .Yrange "Ls-Lus", "Ls" 
'     .Zrange "-h", "-h-t" 
'     .Create
'End With
'
''@ transform: mirror component1:Slot_On_Ground_Above
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'With Transform 
'     .Reset 
'     .Name "component1:Slot_On_Ground_Above" 
'     .Origin "Free" 
'     .Center "0", "0", "0" 
'     .PlaneNormal "1", "0", "0" 
'     .MultipleObjects "True" 
'     .GroupObjects "False" 
'     .Repetitions "1" 
'     .MultipleSelection "False" 
'     .Destination "" 
'     .Material "" 
'     .Transform "Shape", "Mirror" 
'End With
'
''@ boolean subtract shapes: component1:Ground_Plane, component1:Slot_On_Ground_Above
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'Solid.Subtract "component1:Ground_Plane", "component1:Slot_On_Ground_Above"
'
''@ boolean subtract shapes: component1:Ground_Plane, component1:Slot_On_Ground_Above_1
'
''[VERSION]2019.0|28.0.2|20180920[/VERSION]
'Solid.Subtract "component1:Ground_Plane", "component1:Slot_On_Ground_Above_1"
'
'@ define brick: component1:Small_Slot_Groung_Bot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Small_Slot_Groung_Bot" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "Ws/2-Wgcen-Wq/2", "Ws/2-Wgcen+Wq/2" 
     .Yrange "Lf+Lg", "Lf+Lg+Lq" 
     .Zrange "-h", "-h-t" 
     .Create
End With

'@ define brick: component1:Small_slot_Gr_Bot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Small_slot_Gr_Bot" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "Ws/2-Wgc3-Sw/2-Wgcen-Wq/2", "Ws/2-Wgc3-Sw/2-Wgcen+Wq/2" 
     .Yrange "Lf+Lg", "Lf+Lg+Lq" 
     .Zrange "-h", "-h-t" 
     .Create
End With

'@ transform: mirror component1:Small_Slot_Groung_Bot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Small_Slot_Groung_Bot" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "True" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ transform: mirror component1:Small_slot_Gr_Bot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Small_slot_Gr_Bot" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "1", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean subtract shapes: component1:Ground_Plane, component1:Small_Slot_Groung_Bot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:Small_Slot_Groung_Bot"

'@ boolean subtract shapes: component1:Ground_Plane, component1:Small_Slot_Groung_Bot_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:Small_Slot_Groung_Bot_1"

'@ boolean subtract shapes: component1:Ground_Plane, component1:Small_slot_Gr_Bot

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:Small_slot_Gr_Bot"

'@ boolean subtract shapes: component1:Ground_Plane, component1:Small_slot_Gr_Bot_1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Subtract "component1:Ground_Plane", "component1:Small_slot_Gr_Bot_1" 

