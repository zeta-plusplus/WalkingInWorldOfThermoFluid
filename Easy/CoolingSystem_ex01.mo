within WalkingInWorldOfThermoFluid.Easy;

model CoolingSystem_ex01
  extends Modelica.Icons.Example;
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //replaceable package fluid1 = Modelica.Media.Incompressible.Examples.Glycol47;
  //replaceable package fluid1 = Modelica.Media.Incompressible.Examples.Essotherm650;
  //redeclare package Medium = fluid1
  //-----
  //replaceable package fluid2 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = fluid2
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_pump_N(duration = 10, height = 0, offset = 500, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump pump1(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.25, 0.5}, head_nominal = {100, 60, 0}), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 1000, V(displayUnit = "l") = 0.001, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 10, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 10 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1(phi(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-50, 18}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47) annotation(
    Placement(visible = true, transformation(origin = {30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe cooler_hside(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, diameter = 0.02, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = 10, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {120, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, diameter = 0.02, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = 2, use_HeatTransfer = false) annotation(
    Placement(visible = true, transformation(origin = {184, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, T = 15 + 273.15, m_flow = 5, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {10, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe cooler_cside(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, T_start = 15 + 273.15, diameter = 0.02, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = cooler_hside.nNodes, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {120, 76}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {220, 110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1[cooler_hside.nNodes] annotation(
    Placement(visible = true, transformation(origin = {120, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1[cooler_hside.nNodes](C = 10) annotation(
    Placement(visible = true, transformation(origin = {130, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection2[cooler_hside.nNodes] annotation(
    Placement(visible = true, transformation(origin = {120, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Routing.Replicator replicator1(nout = cooler_hside.nNodes) annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Replicator replicator2(nout = cooler_cside.nNodes) annotation(
    Placement(visible = true, transformation(origin = {90, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 5000) annotation(
    Placement(visible = true, transformation(origin = {60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, V = 1 * 0.001, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {210, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {210, -38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_heat_generation(duration = 10, height = 10 * 1000, offset = 100 * 1000, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {198, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe pipe1(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, diameter = 0.02, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = 2, use_HeatTransfer = false) annotation(
    Placement(visible = true, transformation(origin = {170, -110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_ph boundary(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, nPorts = 1, p = 101.325 * 1000, use_h_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume tank(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, T_start = 15 + 273.15, V = 20 * 0.001, nPorts = 2, use_HeatTransfer = false, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, nPorts = 1, p = 101.325 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {70, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47) annotation(
    Placement(visible = true, transformation(origin = {110, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, T_start = 15 + 273.15, V = 1 * 0.001, nPorts = 2, use_HeatTransfer = false, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {180, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_coolant(duration = 10, height = 0.2, offset = 2, startTime = 160) annotation(
    Placement(visible = true, transformation(origin = {-30, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {4, -60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4, use_numberPort = true)  annotation(
    Placement(visible = true, transformation(origin = {-10, 27}, extent = {{-12, -9}, {12, 9}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 5, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-64, -28}, extent = {{-26, -8}, {26, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-22, -32}, extent = {{12, -8}, {-12, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {32, -28}, extent = {{-12, -8}, {12, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue4(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {2, -76}, extent = {{12, -7}, {-12, 7}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue5(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {90, 100}, extent = {{-12, -8}, {12, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue6(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {160, 100}, extent = {{-12, -8}, {12, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue7(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {156, -30}, extent = {{12, -8}, {-12, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue8(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {219, -109}, extent = {{-13, -7}, {13, 7}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue9(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {144, -92}, extent = {{-12, -8}, {12, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_p_tank(k = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-140, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47) annotation(
    Placement(visible = true, transformation(origin = {-80, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature1(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47) annotation(
    Placement(visible = true, transformation(origin = {-20, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature2(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47) annotation(
    Placement(visible = true, transformation(origin = {158, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature3(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47) annotation(
    Placement(visible = true, transformation(origin = {200, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature4(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47) annotation(
    Placement(visible = true, transformation(origin = {130, -110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature5(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature6(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {130, 100}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor[cooler_hside.nNodes] annotation(
    Placement(visible = true, transformation(origin = {120, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Sum sum1(nin = cooler_hside.nNodes)  annotation(
    Placement(visible = true, transformation(origin = {150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(volume1.ports[1], boundary3.ports[1]) annotation(
    Line(points = {{180, 110}, {210, 110}}, color = {0, 127, 255}, thickness = 0.5));
  connect(const.y, replicator1.u) annotation(
    Line(points = {{71, -10}, {73, -10}, {73, -30}, {78, -30}}, color = {0, 0, 127}));
  connect(const.y, replicator2.u) annotation(
    Line(points = {{71, -10}, {73, -10}, {73, 18}, {78, 18}}, color = {0, 0, 127}));
  connect(replicator2.y, convection2.Gc) annotation(
    Line(points = {{101, 18}, {110, 18}}, color = {0, 0, 127}, thickness = 0.5));
  connect(heatCapacitor1.port, convection2.solid) annotation(
    Line(points = {{120, -6}, {120, 8}}, color = {191, 0, 0}, thickness = 0.5));
  connect(replicator1.y, convection1.Gc) annotation(
    Line(points = {{101, -30}, {110, -30}}, color = {0, 0, 127}, thickness = 0.5));
  connect(heatCapacitor1.port, convection1.solid) annotation(
    Line(points = {{120, -6}, {120, -20}}, color = {191, 0, 0}, thickness = 0.5));
  connect(convection1.fluid, cooler_hside.heatPorts) annotation(
    Line(points = {{120, -40}, {120, -46}}, color = {191, 0, 0}, thickness = 0.5));
  connect(speed1.flange, powerSensor1.flange_a) annotation(
    Line(points = {{-60, 50}, {-50, 50}, {-50, 28}}));
  connect(powerSensor1.flange_b, pump1.shaft) annotation(
    Line(points = {{-50, 8}, {-50, -40}}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-89, 50}, {-83, 50}, {-83, 50}, {-83, 50}}, color = {0, 0, 127}));
  connect(ramp_pump_N.y, from_rpm1.u) annotation(
    Line(points = {{-119, 70}, {-116, 70}, {-116, 50}, {-113, 50}}, color = {0, 0, 127}));
  connect(ramp_heat_generation.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{209, -10}, {210, -10}, {210, -28}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow1.port, volume.heatPort) annotation(
    Line(points = {{210, -48}, {210, -60}}, color = {191, 0, 0}));
  connect(pipe.port_b, volume.ports[1]) annotation(
    Line(points = {{194, -50}, {200, -50}, {200, -70}}, color = {0, 127, 255}));
  connect(boundary.ports[1], tank.ports[1]) annotation(
    Line(points = {{-110, -70}, {-110, -50}}, color = {0, 127, 255}, thickness = 0.5));
  connect(boundary1.ports[1], specificEnthalpy.port) annotation(
    Line(points = {{80, -100}, {95, -100}, {95, -110}, {110, -110}}, color = {0, 127, 255}));
  connect(volumeFlowRate1.port_b, cooler_hside.port_a) annotation(
    Line(points = {{40, -50}, {110, -50}}, color = {0, 127, 255}));
  connect(ramp_m_flow_coolant.y, boundary2.m_flow_in) annotation(
    Line(points = {{-19, 120}, {-17, 120}, {-17, 118}, {-1, 118}}, color = {0, 0, 127}));
  connect(pressure.port, volumeFlowRate1.port_a) annotation(
    Line(points = {{4, -50}, {20, -50}}, color = {0, 127, 255}));
  connect(powerSensor1.power, realValue.numberPort) annotation(
    Line(points = {{-39, 26}, {-25.75, 26}, {-25.75, 27}, {-24, 27}}, color = {0, 0, 127}));
  connect(volumeFlowRate1.V_flow, realValue3.numberPort) annotation(
    Line(points = {{30, -39}, {30, -34}, {18, -34}, {18, -28}}, color = {0, 0, 127}));
  connect(pressure.p, realValue4.numberPort) annotation(
    Line(points = {{15, -60}, {15, -76}}, color = {0, 0, 127}));
  connect(const_p_tank.y, boundary1.p_in) annotation(
    Line(points = {{-129, -110}, {-33.5, -110}, {-33.5, -92}, {58, -92}}, color = {0, 0, 127}));
  connect(const_p_tank.y, boundary.p_in) annotation(
    Line(points = {{-128, -110}, {-118, -110}, {-118, -92}}, color = {0, 0, 127}));
  connect(specificEnthalpy.h_out, boundary.h_in) annotation(
    Line(points = {{100, -120}, {-114, -120}, {-114, -92}}, color = {0, 0, 127}));
  connect(tank.ports[2], temperature.port_a) annotation(
    Line(points = {{-110, -50}, {-90, -50}}, color = {0, 127, 255}));
  connect(temperature.port_b, pump1.port_a) annotation(
    Line(points = {{-70, -50}, {-60, -50}}, color = {0, 127, 255}));
  connect(temperature.T, realValue1.numberPort) annotation(
    Line(points = {{-80, -38}, {-80, -33}, {-94, -33}, {-94, -28}}, color = {0, 0, 127}));
  connect(pump1.port_b, temperature1.port_a) annotation(
    Line(points = {{-40, -50}, {-30, -50}}));
  connect(temperature1.port_b, pressure.port) annotation(
    Line(points = {{-10, -50}, {4, -50}}, color = {0, 127, 255}));
  connect(temperature1.T, realValue2.numberPort) annotation(
    Line(points = {{-20, -38}, {-8, -38}, {-8, -32}}, color = {0, 0, 127}));
  connect(cooler_hside.port_b, temperature2.port_a) annotation(
    Line(points = {{130, -50}, {148, -50}}, color = {0, 127, 255}));
  connect(temperature2.port_b, pipe.port_a) annotation(
    Line(points = {{168, -50}, {174, -50}}, color = {0, 127, 255}));
  connect(temperature2.T, realValue7.numberPort) annotation(
    Line(points = {{158, -38}, {170, -38}, {170, -30}}, color = {0, 0, 127}));
  connect(pipe1.port_a, temperature3.port_b) annotation(
    Line(points = {{180, -110}, {200, -110}}, color = {0, 127, 255}));
  connect(volume.ports[2], temperature3.port_a) annotation(
    Line(points = {{200, -70}, {200, -90}}, color = {0, 127, 255}));
  connect(temperature3.T, realValue8.numberPort) annotation(
    Line(points = {{212, -100}, {212, -106.5}, {204, -106.5}, {204, -109}}, color = {0, 0, 127}));
  connect(temperature4.port_a, pipe1.port_b) annotation(
    Line(points = {{140, -110}, {160, -110}}, color = {0, 127, 255}));
  connect(specificEnthalpy.port, temperature4.port_b) annotation(
    Line(points = {{110, -110}, {120, -110}}, color = {0, 127, 255}));
  connect(temperature4.T, realValue9.numberPort) annotation(
    Line(points = {{130, -98}, {130, -92}}, color = {0, 0, 127}));
  connect(boundary2.ports[1], temperature5.port_a) annotation(
    Line(points = {{20, 110}, {60, 110}}, color = {0, 127, 255}));
  connect(temperature5.T, realValue5.numberPort) annotation(
    Line(points = {{71, 100}, {75, 100}}, color = {0, 0, 127}));
  connect(temperature5.port_b, cooler_cside.port_a) annotation(
    Line(points = {{60, 90}, {60, 76}, {110, 76}}, color = {0, 127, 255}));
  connect(cooler_cside.port_b, temperature6.port_a) annotation(
    Line(points = {{130, 76}, {130, 90}}, color = {0, 127, 255}));
  connect(temperature6.port_b, volume1.ports[2]) annotation(
    Line(points = {{130, 110}, {180, 110}}, color = {0, 127, 255}));
  connect(temperature6.T, realValue6.numberPort) annotation(
    Line(points = {{141, 100}, {145, 100}}, color = {0, 0, 127}));
  connect(heatFlowSensor.port_b, cooler_cside.heatPorts) annotation(
    Line(points = {{120, 60}, {120, 72}}, color = {191, 0, 0}, thickness = 0.5));
  connect(heatFlowSensor.port_a, convection2.fluid) annotation(
    Line(points = {{120, 40}, {120, 28}}, color = {191, 0, 0}, thickness = 0.5));
  connect(heatFlowSensor.Q_flow, sum1.u) annotation(
    Line(points = {{130, 50}, {138, 50}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    experiment(StartTime = 0, StopTime = 260, Tolerance = 1e-06, Interval = 0.05),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-160, -140}, {240, 140}}, initialScale = 0.1), graphics = {Rectangle(origin = {108, 28}, extent = {{-62, 96}, {40, -101}}), Text(origin = {94, 128}, extent = {{-34, 4}, {34, -4}}, textString = "Heat Exchanger"), Text(origin = {2, 96}, extent = {{-34, 4}, {34, -4}}, textString = "coolant flow line")}),
    __OpenModelica_commandLineOptions = "");
end CoolingSystem_ex01;
