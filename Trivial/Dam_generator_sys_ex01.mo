within WalkingInWorldOfThermoFluid.Trivial;

model Dam_generator_sys_ex01
  extends Modelica.Icons.Example;
  //----------
  //replaceable package fluid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //replaceable package fluid1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = fluid1
  //----------
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.Pump trb(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, -0.25, -0.50}, head_nominal = {-100, -70, 0}), redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 0.9), N_nominal = 1000, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = false, energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = -10, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, nParallel = 1, p_b_start = 5 * system.p_start) annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-40, 50}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate2(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_N(duration = 10, height = 0, offset = 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-150, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {120, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, dp_nominal(displayUnit = "Pa") = 100 * 1000, m_flow_nominal = 1000) annotation(
    Placement(visible = true, transformation(origin = {80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valve(duration = 10, height = -0.2, offset = 1.0, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.OpenTank dam(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, crossArea = Modelica.Constants.pi / 4.0 * 1.0 ^ 2, height = 100, level(fixed = false, start = 100), nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 1.0, height = 90.0), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 0.0)}, use_portsData = true) annotation(
    Placement(visible = true, transformation(origin = {-160, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, T = 15 + 273.15, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-110, -100}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase) annotation(
    Placement(visible = true, transformation(origin = {50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(massFlowRate1.m_flow, boundary.m_flow_in) annotation(
    Line(points = {{20, -40}, {20, -92}, {-100, -92}}, color = {0, 0, 127}));
  connect(boundary.ports[1], dam.ports[1]) annotation(
    Line(points = {{-120, -100}, {-160, -100}, {-160, -20}}, color = {0, 127, 255}, thickness = 0.5));
  connect(dam.ports[2], pressure1.port) annotation(
    Line(points = {{-160, -20}, {-156, -20}, {-156, -30}, {-90, -30}}, color = {0, 127, 255}));
  connect(ramp_N.y, from_rpm1.u) annotation(
    Line(points = {{-139, 80}, {-132, 80}}, color = {0, 0, 127}));
  connect(from_rpm1.y, speed1.w_ref) annotation(
    Line(points = {{-109, 80}, {-93, 80}, {-93, 80}, {-93, 80}}, color = {0, 0, 127}));
  connect(speed1.flange, powerSensor1.flange_a) annotation(
    Line(points = {{-70, 80}, {-40, 80}, {-40, 60}}));
  connect(powerSensor1.flange_b, trb.shaft) annotation(
    Line(points = {{-40, 40}, {-40, -20}}));
  connect(pressure1.port, volumeFlowRate2.port_a) annotation(
    Line(points = {{-90, -30}, {-80, -30}}, color = {0, 127, 255}));
  connect(pressure2.port, valveLinear1.port_a) annotation(
    Line(points = {{50, -30}, {70, -30}, {70, -30}, {70, -30}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, pressure2.port) annotation(
    Line(points = {{30, -30}, {50, -30}, {50, -30}, {50, -30}}, color = {0, 127, 255}));
  connect(volumeFlowRate2.port_b, trb.port_b) annotation(
    Line(points = {{-60, -30}, {-50, -30}}, color = {0, 127, 255}));
  connect(ramp_valve.y, valveLinear1.opening) annotation(
    Line(points = {{80, 0}, {80, 0}, {80, -22}, {80, -22}}, color = {0, 0, 127}));
  connect(valveLinear1.port_b, boundary1.ports[1]) annotation(
    Line(points = {{90, -30}, {110, -30}, {110, -30}, {110, -30}}, color = {0, 127, 255}));
  connect(volumeFlowRate1.port_b, massFlowRate1.port_a) annotation(
    Line(points = {{0, -30}, {10, -30}}, color = {0, 127, 255}));
  connect(trb.port_a, volumeFlowRate1.port_a) annotation(
    Line(points = {{-30, -30}, {-20, -30}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 70, Tolerance = 1e-06, Interval = 0.140281),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-180, -120}, {140, 120}}), graphics = {Line(origin = {-64.5071, 50.002}, points = {{9.0238, -15.0238}, {7.0238, 12.9762}, {-8.9762, 14.9762}}, arrow = {Arrow.None, Arrow.Open}), Text(origin = {-166, 57}, extent = {{64, -1}, {112, -7}}, textString = "mechanical power"), Text(origin = {-140, -45}, extent = {{64, -1}, {148, -15}}, textString = "hydro turbine by 'pump' component"), Text(origin = {-214, -69}, extent = {{64, -1}, {166, -15}}, textString = "just prevent tank from getting empty"), Text(origin = {-242, 63}, extent = {{68, -13}, {126, -25}}, textString = "port at bottom of tank"), Text(origin = {-210, 55}, extent = {{34, -15}, {126, -25}}, textString = "has pressure due to height of fluid")}),
    __OpenModelica_commandLineOptions = "");
end Dam_generator_sys_ex01;
