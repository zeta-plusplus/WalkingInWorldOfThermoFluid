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
  Modelica.Blocks.Sources.Ramp ramp_pump_N(duration = 10, height = 0, offset = 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump pump1(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.25, 0.5}, head_nominal = {100, 60, 0}), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 1000, V(displayUnit = "l") = 0.001, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 10, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 10 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1(phi(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-40, 18}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47) annotation(
    Placement(visible = true, transformation(origin = {22, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe cooler_hside(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, diameter = 0.02, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = 10, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {120, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, diameter = 0.02, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = 2, use_HeatTransfer = false) annotation(
    Placement(visible = true, transformation(origin = {184, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, T = 15 + 273.15, m_flow = 5, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe cooler_cside(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, T_start = 15 + 273.15, diameter = 0.02, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = cooler_hside.nNodes, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {120, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {230, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1[cooler_hside.nNodes] annotation(
    Placement(visible = true, transformation(origin = {120, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1[cooler_hside.nNodes](C = 10) annotation(
    Placement(visible = true, transformation(origin = {130, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection2[cooler_hside.nNodes] annotation(
    Placement(visible = true, transformation(origin = {120, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Routing.Replicator replicator1(nout = cooler_hside.nNodes) annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Replicator replicator2(nout = cooler_cside.nNodes) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 5000) annotation(
    Placement(visible = true, transformation(origin = {60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, V = 1 * 0.001, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {212, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {212, -38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_heat_generation(duration = 10, height = 10 * 1000, offset = 100 * 1000, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {198, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe pipe1(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, diameter = 0.02, length = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_vb, nNodes = 2, use_HeatTransfer = false) annotation(
    Placement(visible = true, transformation(origin = {170, -110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_ph boundary(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, nPorts = 1, p = 101.325 * 1000, use_h_in = true) annotation(
    Placement(visible = true, transformation(origin = {-116, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume tank(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, T_start = 15 + 273.15, V = 20 * 0.001, nPorts = 2, use_HeatTransfer = false, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-86, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = Modelica.Media.Incompressible.Examples.Glycol47) annotation(
    Placement(visible = true, transformation(origin = {110, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, T_start = 15 + 273.15, V = 1 * 0.001, nPorts = 2, use_HeatTransfer = false, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {180, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_coolant(duration = 10, height = 0.5, offset = 5, startTime = 120) annotation(
    Placement(visible = true, transformation(origin = {-40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {-64, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {-16, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature2(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {160, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {-4, -60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature3(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {212, -94}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.Temperature temperature4(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {132, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature5(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {92, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature6(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {146, 54}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4, use_numberPort = true)  annotation(
    Placement(visible = true, transformation(origin = {-10, 27}, extent = {{-12, -9}, {12, 9}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 5, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-70, -22}, extent = {{12, -8}, {-12, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-22, -22}, extent = {{12, -8}, {-12, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {36, -30}, extent = {{-12, -8}, {12, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue4(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-6, -76}, extent = {{12, -7}, {-12, 7}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue5(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {86, 60}, extent = {{12, -8}, {-12, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue6(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {160, 38}, extent = {{-12, -8}, {12, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue7(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {154, -16}, extent = {{12, -8}, {-12, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue8(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {227, -109}, extent = {{-13, -7}, {13, 7}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue9(significantDigits = 4, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {158, -96}, extent = {{-12, -8}, {12, 8}}, rotation = 0)));
equation
  connect(volume1.ports[1], boundary3.ports[1]) annotation(
    Line(points = {{180, 70}, {220, 70}}, color = {0, 127, 255}, thickness = 0.5));
  connect(convection2.fluid, cooler_cside.heatPorts) annotation(
    Line(points = {{120, 20}, {120, 26}}, color = {191, 0, 0}, thickness = 0.5));
  connect(const.y, replicator1.u) annotation(
    Line(points = {{71, -10}, {73, -10}, {73, -30}, {78, -30}}, color = {0, 0, 127}));
  connect(const.y, replicator2.u) annotation(
    Line(points = {{71, -10}, {73, -10}, {73, 10}, {78, 10}}, color = {0, 0, 127}));
  connect(replicator2.y, convection2.Gc) annotation(
    Line(points = {{101, 10}, {110, 10}}, color = {0, 0, 127}, thickness = 0.5));
  connect(heatCapacitor1.port, convection2.solid) annotation(
    Line(points = {{120, -10}, {120, 0}}, color = {191, 0, 0}, thickness = 0.5));
  connect(replicator1.y, convection1.Gc) annotation(
    Line(points = {{101, -30}, {110, -30}}, color = {0, 0, 127}, thickness = 0.5));
  connect(heatCapacitor1.port, convection1.solid) annotation(
    Line(points = {{120, -10}, {120, -20}}, color = {191, 0, 0}, thickness = 0.5));
  connect(convection1.fluid, cooler_hside.heatPorts) annotation(
    Line(points = {{120, -40}, {120, -46}}, color = {191, 0, 0}, thickness = 0.5));
  connect(speed1.flange, powerSensor1.flange_a) annotation(
    Line(points = {{-60, 50}, {-40, 50}, {-40, 28}}));
  connect(powerSensor1.flange_b, pump1.shaft) annotation(
    Line(points = {{-40, 8}, {-40, -40}}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-89, 50}, {-83, 50}, {-83, 50}, {-83, 50}}, color = {0, 0, 127}));
  connect(ramp_pump_N.y, from_rpm1.u) annotation(
    Line(points = {{-119, 70}, {-116, 70}, {-116, 50}, {-113, 50}}, color = {0, 0, 127}));
  connect(ramp_heat_generation.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{209, -10}, {212, -10}, {212, -28}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow1.port, volume.heatPort) annotation(
    Line(points = {{212, -48}, {212, -60}}, color = {191, 0, 0}));
  connect(pipe.port_b, volume.ports[1]) annotation(
    Line(points = {{194, -50}, {202, -50}, {202, -70}}, color = {0, 127, 255}));
  connect(boundary.ports[1], tank.ports[1]) annotation(
    Line(points = {{-106, -50}, {-88, -50}, {-88, -50}, {-86, -50}}, color = {0, 127, 255}, thickness = 0.5));
  connect(specificEnthalpy.h_out, boundary.h_in) annotation(
    Line(points = {{99, -120}, {-134, -120}, {-134, -46}, {-128, -46}}, color = {0, 0, 127}));
  connect(boundary1.ports[1], specificEnthalpy.port) annotation(
    Line(points = {{80, -100}, {95, -100}, {95, -110}, {110, -110}}, color = {0, 127, 255}));
  connect(volumeFlowRate1.port_b, cooler_hside.port_a) annotation(
    Line(points = {{32, -50}, {110, -50}}, color = {0, 127, 255}));
  connect(ramp_m_flow_coolant.y, boundary2.m_flow_in) annotation(
    Line(points = {{-28, 80}, {-26, 80}, {-26, 78}, {-10, 78}}, color = {0, 0, 127}));
  connect(temperature.port, pump1.port_a) annotation(
    Line(points = {{-64, -50}, {-50, -50}}, color = {0, 127, 255}));
  connect(temperature.port, tank.ports[2]) annotation(
    Line(points = {{-64, -50}, {-86, -50}}, color = {0, 127, 255}));
  connect(pump1.port_b, temperature1.port) annotation(
    Line(points = {{-30, -50}, {-16, -50}}, color = {0, 127, 255}));
  connect(temperature1.port, pressure.port) annotation(
    Line(points = {{-16, -50}, {-4, -50}}, color = {0, 127, 255}));
  connect(pressure.port, volumeFlowRate1.port_a) annotation(
    Line(points = {{-4, -50}, {12, -50}}, color = {0, 127, 255}));
  connect(cooler_hside.port_b, temperature2.port) annotation(
    Line(points = {{130, -50}, {160, -50}}, color = {0, 127, 255}));
  connect(temperature2.port, pipe.port_a) annotation(
    Line(points = {{160, -50}, {174, -50}}, color = {0, 127, 255}));
  connect(volume.ports[2], temperature3.port) annotation(
    Line(points = {{202, -70}, {202, -94}}, color = {0, 127, 255}));
  connect(pipe1.port_a, temperature3.port) annotation(
    Line(points = {{180, -110}, {202, -110}, {202, -94}}, color = {0, 127, 255}));
  connect(specificEnthalpy.port, temperature4.port) annotation(
    Line(points = {{110, -110}, {132, -110}}, color = {0, 127, 255}));
  connect(temperature4.port, pipe1.port_b) annotation(
    Line(points = {{132, -110}, {160, -110}}, color = {0, 127, 255}));
  connect(temperature5.port, cooler_cside.port_a) annotation(
    Line(points = {{92, 30}, {110, 30}}, color = {0, 127, 255}));
  connect(boundary2.ports[1], temperature5.port) annotation(
    Line(points = {{10, 70}, {70, 70}, {70, 30}, {92, 30}}, color = {0, 127, 255}));
  connect(temperature6.port, volume1.ports[2]) annotation(
    Line(points = {{136, 54}, {136, 70}, {180, 70}}, color = {0, 127, 255}));
  connect(cooler_cside.port_b, temperature6.port) annotation(
    Line(points = {{130, 30}, {136, 30}, {136, 54}}, color = {0, 127, 255}));
  connect(powerSensor1.power, realValue.numberPort) annotation(
    Line(points = {{-29, 26}, {-25.75, 26}, {-25.75, 27}, {-24, 27}}, color = {0, 0, 127}));
  connect(realValue1.numberPort, temperature.T) annotation(
    Line(points = {{-56, -22}, {-56, -29}, {-57, -29}, {-57, -40}}, color = {0, 0, 127}));
  connect(temperature1.T, realValue2.numberPort) annotation(
    Line(points = {{-8, -40}, {-8, -22}}, color = {0, 0, 127}));
  connect(volumeFlowRate1.V_flow, realValue3.numberPort) annotation(
    Line(points = {{22, -38}, {22, -30}}, color = {0, 0, 127}));
  connect(pressure.p, realValue4.numberPort) annotation(
    Line(points = {{8, -60}, {8, -76}}, color = {0, 0, 127}));
  connect(temperature5.T, realValue5.numberPort) annotation(
    Line(points = {{100, 40}, {100, 60}}, color = {0, 0, 127}));
  connect(temperature6.T, realValue6.numberPort) annotation(
    Line(points = {{146, 48}, {146, 38}}, color = {0, 0, 127}));
  connect(temperature2.T, realValue7.numberPort) annotation(
    Line(points = {{168, -40}, {168, -16}}, color = {0, 0, 127}));
  connect(temperature3.T, realValue8.numberPort) annotation(
    Line(points = {{212, -101}, {212, -110}}, color = {0, 0, 127}));
  connect(temperature4.T, realValue9.numberPort) annotation(
    Line(points = {{140, -100}, {144, -100}, {144, -96}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 200, Tolerance = 1e-06, Interval = 0.05),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-140, -140}, {240, 100}}, initialScale = 0.1), graphics = {Rectangle(origin = {112, 6}, extent = {{-66, 70}, {42, -74}}), Text(origin = {94, 84}, extent = {{-34, 4}, {34, -4}}, textString = "Heat Exchanger"), Text(origin = {2, 56}, extent = {{-34, 4}, {34, -4}}, textString = "coolant flow line")}),
    __OpenModelica_commandLineOptions = "");
end CoolingSystem_ex01;
