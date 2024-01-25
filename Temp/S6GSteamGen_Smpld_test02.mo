within WalkingInWorldOfThermoFluid.Temp;

model S6GSteamGen_Smpld_test02
  extends Modelica.Icons.Example;
  //----------
  package ThTrspt1 = Modelica.Media.Water.StandardWater "thermo transport fluid, 1st loop(reactor side)";
  package ThTrspt2 = Modelica.Media.Water.StandardWater "thermo transport fluid, 2nd loop(steam generator side)";
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {-126, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = ThTrspt1) annotation(
    Placement(transformation(origin = {30, -50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Pipes.DynamicPipe cooler_hside(redeclare package Medium = ThTrspt1, T_start = 275 + 273.15, diameter = 0.1, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = 10, nParallel = 100, p_a_start = 150*100*1000, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {120, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = ThTrspt1, T_start = 275 + 273.15, diameter = 0.1, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = 2, nParallel = 100, p_a_start = 150*100*1000, use_HeatTransfer = false) annotation(
    Placement(visible = true, transformation(origin = {184, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T CoolantSply(redeclare package Medium = ThTrspt2, T = 90 + 273.15, m_flow = 5, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(transformation(origin = {-72, 132}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT vaporExit(redeclare package Medium = ThTrspt2, nPorts = 1, p = 100*1000, T = 99 + 273.15) annotation(
    Placement(transformation(origin = {290, 96}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1[cooler_hside.nNodes] annotation(
    Placement(transformation(origin = {120, -28}, extent = {{8, -8}, {-8, 8}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1[cooler_hside.nNodes](each C = 10) annotation(
    Placement(transformation(origin = {130, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection2[cooler_hside.nNodes] annotation(
    Placement(transformation(origin = {120, 17}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Blocks.Routing.Replicator replicator1(nout = cooler_hside.nNodes) annotation(
    Placement(transformation(origin = {94, -28}, extent = {{-6, -7}, {6, 7}})));
  Modelica.Blocks.Routing.Replicator replicator2(nout = cooler_hside.nNodes) annotation(
    Placement(transformation(origin = {94, 17}, extent = {{-6, -7}, {6, 7}})));
  Modelica.Blocks.Sources.Constant hConv_HX(k = 10000) annotation(
    Placement(transformation(origin = {10, 46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = ThTrspt1, T_start = 275 + 273.15, V = 1, nPorts = 2, p_start = 150*100*1000, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {210, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(transformation(origin = {210, -38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_heat_generation(duration = 1, height = 0*165*1e6, offset = 1*165*1e6, startTime = 10) annotation(
    Placement(transformation(origin = {194, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Pipes.DynamicPipe pipe1(redeclare package Medium = ThTrspt1, T_start = 275 + 273.15, diameter = 0.1, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = 2, nParallel = 100, p_a_start = 150*100*1000, use_HeatTransfer = false) annotation(
    Placement(visible = true, transformation(origin = {170, -110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_ph boundary_tank_pReg(redeclare package Medium = ThTrspt1, nPorts = 1, p = 101.325*1000, use_h_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume tank(redeclare package Medium = ThTrspt1, T_start = 275 + 273.15, V = 1, nPorts = 2, p_start = 150*100*1000, use_HeatTransfer = false, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary_SnkTank(redeclare package Medium = ThTrspt1, nPorts = 1, p = 101.325*1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {70, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = ThTrspt1) annotation(
    Placement(transformation(origin = {107, -117}, extent = {{-7, -7}, {7, 7}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_coolant(duration = 10, height = 0, offset = 80, startTime = 160) annotation(
    Placement(transformation(origin = {-112, 140}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = ThTrspt2) annotation(
    Placement(transformation(origin = {1, -57}, extent = {{-7, 7}, {7, -7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue5(significantDigits = 4, use_numberPort = true) annotation(
    Placement(transformation(origin = {-32, 138}, extent = {{12, -8}, {-12, 8}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue6(significantDigits = 4, use_numberPort = true) annotation(
    Placement(transformation(origin = {224, 116}, extent = {{12, -8}, {-12, 8}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue7(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {156, -30}, extent = {{12, -8}, {-12, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue8(significantDigits = 4, use_numberPort = true) annotation(
    Placement(transformation(origin = {232, -100}, extent = {{-13, -7}, {13, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue9(significantDigits = 4, use_numberPort = true) annotation(
    Placement(transformation(origin = {144, -95}, extent = {{-12, -8}, {12, 8}})));
  Modelica.Blocks.Sources.Constant const_p_tank(k = 150*100*1000) annotation(
    Placement(visible = true, transformation(origin = {-140, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = ThTrspt1) annotation(
    Placement(visible = true, transformation(origin = {-83, -50}, extent = {{-7, -8}, {7, 8}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature1(redeclare package Medium = ThTrspt1) annotation(
    Placement(visible = true, transformation(origin = {-17, -50}, extent = {{-7, -8}, {7, 8}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature2(redeclare package Medium = ThTrspt1) annotation(
    Placement(transformation(origin = {155, -50}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature3(redeclare package Medium = ThTrspt1) annotation(
    Placement(transformation(origin = {200, -102}, extent = {{-8, -7}, {8, 7}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature4(redeclare package Medium = ThTrspt1) annotation(
    Placement(transformation(origin = {127, -110}, extent = {{7, -7}, {-7, 7}})));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature5(redeclare package Medium = ThTrspt2) annotation(
    Placement(transformation(origin = {-35, 125}, extent = {{-7, -6}, {7, 6}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature6(redeclare package Medium = ThTrspt2) annotation(
    Placement(transformation(origin = {229.188, 103.056}, extent = {{6.94444, 6.8125}, {-6.94444, -6.8125}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor[cooler_hside.nNodes] annotation(
    Placement(transformation(origin = {120, 50}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Blocks.Math.Sum sum1(nin = cooler_hside.nNodes) annotation(
    Placement(transformation(origin = {140, 50}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue4(significantDigits = 4, use_numberPort = true) annotation(
    Placement(transformation(origin = {-5, -76}, extent = {{12, -7}, {-12, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {32, -28}, extent = {{-12, -8}, {12, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-22, -32}, extent = {{12, -8}, {-12, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 5, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-78, -29}, extent = {{-12, -7}, {12, 7}}, rotation = 0)));
  Modelica.Fluid.Machines.ControlledPump pump(redeclare package Medium = ThTrspt1, T_start = 275 + 273.15, control_m_flow = true, m_flow_nominal = 980, m_flow_start = 980, p_a_nominal = 100*100*1000, p_a_start = 150*100*1000, p_b_nominal = 150*100*1000, p_b_start = 150*100*1000, use_m_flow_set = true)  annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_reactorFluid(duration = 10, height = 0, offset = 980, startTime = 160) annotation(
    Placement(visible = true, transformation(origin = {-86, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant A_HX(k = 20) annotation(
    Placement(transformation(origin = {10, 14}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Product product annotation(
    Placement(transformation(origin = {35, 31}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue81(significantDigits = 4, use_numberPort = true) annotation(
    Placement(transformation(origin = {229, -10}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler SteamGen(redeclare package Medium = ThTrspt2, m_D = 0.001, cp_D = 1, V_t = 10, V_l(start = 0.5*SteamGen.V_t, fixed = true), p_start = 5*100*1000, V_l_start = 0.5*SteamGen.V_t, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p(fixed = true))  annotation(
    Placement(transformation(origin = {108.303, 118.886}, extent = {{13.6758, -15.9113}, {-13.6758, 15.9113}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector thermalCollector(m = cooler_hside.nNodes)  annotation(
    Placement(transformation(origin = {120, 72}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue811(significantDigits = 4, use_numberPort = true) annotation(
    Placement(transformation(origin = {167, 50}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowSteam(redeclare package Medium = ThTrspt2)  annotation(
    Placement(transformation(origin = {179, 133}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue61(significantDigits = 4, use_numberPort = true) annotation(
    Placement(transformation(origin = {182, 119}, extent = {{-12, -8}, {12, 8}})));
  Modelica.Fluid.Valves.ValveLinear VaporValve(redeclare package Medium = ThTrspt2, dp_nominal = 5*100*1000, m_flow_nominal = 100) annotation(
    Placement(transformation(origin = {196, 116}, extent = {{50, -10}, {70, -30}})));
  Modelica.Blocks.Sources.Ramp ramp_valveopen(duration = 10, height = -0.0, offset = 1, startTime = 300) annotation(
    Placement(transformation(origin = {236, 74}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowWaterSupply(redeclare package Medium = ThTrspt2)  annotation(
    Placement(transformation(origin = {24, 105}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue611(significantDigits = 4)  annotation(
    Placement(transformation(origin = {32, 88}, extent = {{-12, -8}, {12, 8}})));
  Modelica.Fluid.Sources.Boundary_pT OverflowLineSink(redeclare package Medium = ThTrspt2, T = 99 + 273.15, nPorts = 1, p = 100*1000) annotation(
    Placement(transformation(origin = {-26, 216}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Valves.ValveLinear OverflowLineValve(redeclare package Medium = ThTrspt2, dp_nominal = 5*100*1000, m_flow_nominal = 100) annotation(
    Placement(transformation(origin = {-12, 136}, extent = {{50, -10}, {70, -30}}, rotation = 90)));
  Modelica.Blocks.Continuous.PI ctrl_pi(T = 0.002, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0, k = 1/1000000) annotation(
    Placement(transformation(origin = {129, 196}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue6111(significantDigits = 4) annotation(
    Placement(transformation(origin = {86, 206}, extent = {{12, -8}, {-12, 8}})));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(transformation(origin = {158, 173}, extent = {{-7, -7}, {7, 7}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowOverFlowLine(redeclare package Medium = ThTrspt2) annotation(
    Placement(transformation(origin = {8, 151}, extent = {{7, -7}, {-7, 7}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue51(significantDigits = 4, use_numberPort = true) annotation(
    Placement(transformation(origin = {-13, 161}, extent = {{12, -8}, {-12, 8}})));
  Modelica.Blocks.Math.Feedback feedback11 annotation(
    Placement(transformation(origin = {30, 151}, extent = {{7, -7}, {-7, 7}}, rotation = -90)));
equation
  connect(replicator2.y, convection2.Gc) annotation(
    Line(points = {{101, 17}, {112, 17}}, color = {0, 0, 127}, thickness = 0.5));
  connect(heatCapacitor1.port, convection2.solid) annotation(
    Line(points = {{120, -6}, {120, 9}}, color = {191, 0, 0}, thickness = 1));
  connect(replicator1.y, convection1.Gc) annotation(
    Line(points = {{101, -28}, {112, -28}}, color = {0, 0, 127}, thickness = 0.5));
  connect(heatCapacitor1.port, convection1.solid) annotation(
    Line(points = {{120, -6}, {120, -20}}, color = {191, 0, 0}, thickness = 1));
  connect(convection1.fluid, cooler_hside.heatPorts) annotation(
    Line(points = {{120, -36}, {120, -46}}, color = {191, 0, 0}, thickness = 1));
  connect(ramp_heat_generation.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{205, -10}, {210, -10}, {210, -28}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow1.port, volume.heatPort) annotation(
    Line(points = {{210, -48}, {210, -60}}, color = {191, 0, 0}, thickness = 1));
  connect(pipe.port_b, volume.ports[1]) annotation(
    Line(points = {{194, -50}, {200, -50}, {200, -70}}, color = {0, 127, 255}, thickness = 1));
  connect(boundary_tank_pReg.ports[1], tank.ports[1]) annotation(
    Line(points = {{-110, -70}, {-110, -50}}, color = {0, 127, 255}, thickness = 1));
  connect(boundary_SnkTank.ports[1], specificEnthalpy.port) annotation(
    Line(points = {{80, -100}, {95, -100}, {95, -110}, {107, -110}}, color = {0, 127, 255}, thickness = 1));
  connect(volumeFlowRate1.port_b, cooler_hside.port_a) annotation(
    Line(points = {{40, -50}, {110, -50}}, color = {0, 127, 255}, thickness = 1));
  connect(ramp_m_flow_coolant.y, CoolantSply.m_flow_in) annotation(
    Line(points = {{-101, 140}, {-83, 140}}, color = {0, 0, 127}));
  connect(pressure.port, volumeFlowRate1.port_a) annotation(
    Line(points = {{1, -50}, {20, -50}}, color = {0, 127, 255}, thickness = 1));
  connect(const_p_tank.y, boundary_SnkTank.p_in) annotation(
    Line(points = {{-129, -110}, {-33.5, -110}, {-33.5, -92}, {58, -92}}, color = {0, 0, 127}));
  connect(const_p_tank.y, boundary_tank_pReg.p_in) annotation(
    Line(points = {{-128, -110}, {-118, -110}, {-118, -92}}, color = {0, 0, 127}));
  connect(tank.ports[2], temperature.port_a) annotation(
    Line(points = {{-110, -50}, {-90, -50}}, color = {0, 127, 255}, thickness = 1));
  connect(temperature1.port_b, pressure.port) annotation(
    Line(points = {{-10, -50}, {1, -50}}, color = {0, 127, 255}, thickness = 1));
  connect(cooler_hside.port_b, temperature2.port_a) annotation(
    Line(points = {{130, -50}, {148, -50}}, color = {0, 127, 255}, thickness = 1));
  connect(temperature2.port_b, pipe.port_a) annotation(
    Line(points = {{162, -50}, {174, -50}}, color = {0, 127, 255}, thickness = 1));
  connect(temperature2.T, realValue7.numberPort) annotation(
    Line(points = {{155, -42}, {155, -38}, {170, -38}, {170, -30}}, color = {0, 0, 127}));
  connect(pipe1.port_a, temperature3.port_b) annotation(
    Line(points = {{180, -110}, {200, -110}}, color = {0, 127, 255}, thickness = 1));
  connect(volume.ports[2], temperature3.port_a) annotation(
    Line(points = {{200, -70}, {200, -94}}, color = {0, 127, 255}, thickness = 1));
  connect(temperature4.port_a, pipe1.port_b) annotation(
    Line(points = {{134, -110}, {160, -110}}, color = {0, 127, 255}, thickness = 1));
  connect(specificEnthalpy.port, temperature4.port_b) annotation(
    Line(points = {{107, -110}, {120, -110}}, color = {0, 127, 255}, thickness = 1));
  connect(temperature4.T, realValue9.numberPort) annotation(
    Line(points = {{127, -102}, {127, -95}, {130, -95}}, color = {0, 0, 127}));
  connect(CoolantSply.ports[1], temperature5.port_a) annotation(
    Line(points = {{-62, 132}, {-35, 132}}, color = {0, 127, 255}, thickness = 1));
  connect(temperature5.T, realValue5.numberPort) annotation(
    Line(points = {{-28.4, 125}, {-15.9, 125}, {-15.9, 138}, {-18.4, 138}}, color = {0, 0, 127}));
  connect(temperature6.T, realValue6.numberPort) annotation(
    Line(points = {{237, 103}, {234.281, 103}, {234.281, 116}, {238, 116}}, color = {0, 0, 127}));
  connect(heatFlowSensor.port_a, convection2.fluid) annotation(
    Line(points = {{120, 44}, {120, 25}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor.Q_flow, sum1.u) annotation(
    Line(points = {{127, 50}, {133, 50}}, color = {0, 0, 127}, thickness = 0.5));
  connect(pressure.p, realValue4.numberPort) annotation(
    Line(points = {{9, -57}, {9, -76}}, color = {0, 0, 127}));
  connect(volumeFlowRate1.V_flow, realValue3.numberPort) annotation(
    Line(points = {{30, -39}, {30, -34}, {18, -34}, {18, -28}}, color = {0, 0, 127}));
  connect(temperature1.T, realValue2.numberPort) annotation(
    Line(points = {{-17, -41}, {-17, -38}, {-8, -38}, {-8, -32}}, color = {0, 0, 127}));
  connect(temperature.T, realValue1.numberPort) annotation(
    Line(points = {{-83, -41}, {-83, -39}, {-92, -39}, {-92, -29}}, color = {0, 0, 127}));
  connect(temperature.port_b, pump.port_a) annotation(
    Line(points = {{-76, -50}, {-64, -50}}, color = {0, 127, 255}, thickness = 1));
  connect(pump.port_b, temperature1.port_a) annotation(
    Line(points = {{-36, -50}, {-24, -50}}, color = {0, 127, 255}, thickness = 1));
  connect(ramp_m_flow_reactorFluid.y, pump.m_flow_set) annotation(
    Line(points = {{-74, 22}, {-57, 22}, {-57, -39}}, color = {0, 0, 127}));
  connect(hConv_HX.y, product.u1) annotation(
    Line(points = {{22, 46}, {27, 46}, {27, 35}}, color = {0, 0, 127}));
  connect(A_HX.y, product.u2) annotation(
    Line(points = {{21, 14}, {27, 14}, {27, 27}}, color = {0, 0, 127}));
  connect(product.y, replicator2.u) annotation(
    Line(points = {{43, 31}, {54, 31}, {54, 17}, {87, 17}}, color = {0, 0, 127}));
  connect(product.y, replicator1.u) annotation(
    Line(points = {{43, 31}, {54, 31}, {54, -28}, {87, -28}}, color = {0, 0, 127}));
  connect(ramp_heat_generation.y, realValue81.numberPort) annotation(
    Line(points = {{206, -10}, {216, -10}}, color = {0, 0, 127}));
  connect(heatFlowSensor.port_b, thermalCollector.port_a) annotation(
    Line(points = {{120, 56}, {120, 66}}, color = {191, 0, 0}, thickness = 1));
  connect(sum1.y, realValue811.numberPort) annotation(
    Line(points = {{147, 50}, {154, 50}}, color = {0, 0, 127}));
  connect(massFlowSteam.port_b, temperature6.port_a) annotation(
    Line(points = {{185, 133}, {229, 133}, {229, 110}}, color = {0, 127, 255}, thickness = 1));
  connect(massFlowSteam.m_flow, realValue61.numberPort) annotation(
    Line(points = {{179, 139.6}, {169, 139.6}, {169, 118.2}, {168, 118.2}}, color = {0, 0, 127}));
  connect(temperature6.port_b, VaporValve.port_a) annotation(
    Line(points = {{229, 96}, {237.688, 96}, {237.688, 96.1111}, {246.188, 96.1111}}, color = {0, 127, 255}, thickness = 1));
  connect(VaporValve.port_b, vaporExit.ports[1]) annotation(
    Line(points = {{266, 96}, {280, 96}}, color = {0, 127, 255}, thickness = 1));
  connect(ramp_valveopen.y, VaporValve.opening) annotation(
    Line(points = {{247, 74}, {255, 74}, {255, 88}}, color = {0, 0, 127}));
  connect(temperature5.port_b, massFlowWaterSupply.port_a) annotation(
    Line(points = {{-35, 118}, {-35, 105}, {17, 105}}, color = {0, 127, 255}, thickness = 1));
  connect(massFlowSteam.port_a, SteamGen.port_b) annotation(
    Line(points = {{173, 133}, {108, 133}}, color = {0, 127, 255}, thickness = 1));
  connect(thermalCollector.port_b, SteamGen.heatPort) annotation(
    Line(points = {{120, 78}, {120, 88}, {92, 88}, {92, 119}}, color = {191, 0, 0}, thickness = 1));
  connect(ctrl_pi.y, OverflowLineValve.opening) annotation(
    Line(points = {{118, 196}, {16, 196}}, color = {0, 0, 127}));
  connect(realValue6111.numberPort, ctrl_pi.y) annotation(
    Line(points = {{99.8, 206}, {107.8, 206}, {107.8, 196}, {118, 196}}, color = {0, 0, 127}));
  connect(massFlowWaterSupply.m_flow, realValue611.numberPort) annotation(
    Line(points = {{24, 112.7}, {12, 112.7}, {12, 87.7}, {18, 87.7}}, color = {0, 0, 127}));
  connect(feedback1.u2, massFlowSteam.m_flow) annotation(
    Line(points = {{164, 173}, {179, 173}, {179, 140}}, color = {0, 0, 127}));
  connect(massFlowWaterSupply.port_b, SteamGen.port_a) annotation(
    Line(points = {{31, 105}, {108, 105}}, color = {0, 127, 255}, thickness = 1));
  connect(ctrl_pi.u, feedback1.y) annotation(
    Line(points = {{141, 196}, {158, 196}, {158, 179}}, color = {0, 0, 127}));
  connect(SteamGen.port_a, massFlowOverFlowLine.port_a) annotation(
    Line(points = {{108, 106}, {8, 106}, {8, 144}}, color = {0, 127, 255}, thickness = 1));
  connect(massFlowOverFlowLine.port_b, OverflowLineValve.port_a) annotation(
    Line(points = {{8, 158}, {8, 186}}, color = {0, 127, 255}, thickness = 1));
  connect(realValue51.numberPort, massFlowOverFlowLine.m_flow) annotation(
    Line(points = {{0.8, 161}, {16, 161}, {16, 152}}, color = {0, 0, 127}));
  connect(massFlowOverFlowLine.m_flow, feedback11.u2) annotation(
    Line(points = {{15.7, 151}, {22.7, 151}, {22.7, 150}, {23.7, 150}}, color = {0, 0, 127}));
  connect(massFlowWaterSupply.m_flow, feedback11.u1) annotation(
    Line(points = {{24, 112.7}, {30, 112.7}, {30, 145.7}}, color = {0, 0, 127}));
  connect(feedback11.y, feedback1.u1) annotation(
    Line(points = {{30, 157}, {30, 167}, {158, 167}}, color = {0, 0, 127}));
  connect(OverflowLineSink.ports[1], OverflowLineValve.port_b) annotation(
    Line(points = {{-16, 216}, {8, 216}, {8, 206}}, color = {0, 127, 255}, thickness = 1));
  connect(specificEnthalpy.h_out, boundary_tank_pReg.h_in) annotation(
    Line(points = {{100, -116}, {-114, -116}, {-114, -92}}, color = {0, 0, 127}));
  connect(temperature3.T, realValue8.numberPort) annotation(
    Line(points = {{208, -102}, {217, -102}, {217, -100}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-06, Interval = 0.2),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-160, -140}, {300, 240}}, initialScale = 0.1), graphics = {Rectangle(origin = {110, 35}, lineThickness = 1, extent = {{-62, 103}, {40, -108}}), Text(origin = {112, 149}, extent = {{-34, 7}, {34, -7}}, textString = "Heat Exchanger"), Text(origin = {-84, 106}, extent = {{-34, 6}, {34, -6}}, textString = "coolant flow line")}),
    __OpenModelica_commandLineOptions = "");
end S6GSteamGen_Smpld_test02;
