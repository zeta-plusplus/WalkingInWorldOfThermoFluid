within WalkingInWorldOfThermoFluid.Trivial;

model TurbineAsCompressor_ex01
  extends Modelica.Icons.Example;
  //package fluid1= Modelica.Media.R134a.R134a_ph;
  package fluid1 = Modelica.Media.Air.DryAirNasa;
  
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(origin = {14, 14}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sources.Boundary_pT boundary(nPorts = 1, redeclare package Medium = fluid1, p = 1e5, T = 288.15)  annotation(
    Placement(transformation(origin = {26, 112}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed annotation(
    Placement(transformation(origin = {152, 46}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(height = 0, duration = 1, offset = 5000, startTime = 15)  annotation(
    Placement(transformation(origin = {190, 46}, extent = {{4, -4}, {-4, 4}})));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm annotation(
    Placement(transformation(origin = {173, 46}, extent = {{3, -3}, {-3, 3}})));
  TRANSFORM.Fluid.Machines.Turbine_SinglePhase_Stodola Cmp(redeclare package Medium = fluid1, p_inlet_nominal = 1e6, m_flow_nominal = -1)  annotation(
    Placement(transformation(origin = {80, 46}, extent = {{20, -20}, {-20, 20}}, rotation = -0)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Cmp_in(redeclare package Medium = fluid1)  annotation(
    Placement(transformation(origin = {60, 89}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Cmp_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {100, 90}, extent = {{3, -3}, {-3, 3}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 288.15, nPorts = 1, p = 1e5) annotation(
    Placement(transformation(origin = {190, 114}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Valves.ValveLinear Valve(redeclare package Medium = fluid1, dp_nominal = 1e6, m_flow_nominal = 1)  annotation(
    Placement(transformation(origin = {156, 114}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_valve_open(height = -0.2, duration = 1, offset = 1, startTime = 20)  annotation(
    Placement(transformation(origin = {156, 137}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Cmp_in(redeclare package Medium = fluid1)  annotation(
    Placement(transformation(origin = {60, 78}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Cmp_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {100, 78}, extent = {{3, -3}, {-3, 3}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume Vol(redeclare package Medium = fluid1, p_start = 1e6, T_start = 673.15, use_portsData = false, V = 0.01, nPorts = 2)  annotation(
    Placement(transformation(origin = {128, 124}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Sensors.Pressure p_Cmp_in(redeclare package Medium = fluid1)  annotation(
    Placement(transformation(origin = {54, 68}, extent = {{3, -3}, {-3, 3}}, rotation = -0)));
  Modelica.Fluid.Sensors.Pressure p_Cmp_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {108, 68}, extent = {{-3, -3}, {3, 3}}, rotation = -0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor pwr_Cmp annotation(
    Placement(transformation(origin = {110, 46}, extent = {{3, -3}, {-3, 3}})));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor trq_Cmp annotation(
    Placement(transformation(origin = {120, 46}, extent = {{3, -3}, {-3, 3}}, rotation = -0)));
  Modelica.Blocks.Sources.Ramp ramp_partialArc(duration = 1, height = 1, offset = 1, startTime = 10) annotation(
    Placement(transformation(origin = {102, 18}, extent = {{4, -4}, {-4, 4}}, rotation = -0)));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_Cmp_in(redeclare package Medium = fluid1)  annotation(
    Placement(transformation(origin = {60, 100}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
equation
  connect(speed.w_ref, from_rpm.y) annotation(
    Line(points = {{164, 46}, {170, 46}}, color = {0, 0, 127}));
  connect(from_rpm.u, ramp_Nmech.y) annotation(
    Line(points = {{177, 46}, {186, 46}}, color = {0, 0, 127}));
  connect(Valve.port_b, boundary1.ports[1]) annotation(
    Line(points = {{166, 114}, {180, 114}}, color = {0, 127, 255}));
  connect(ramp_valve_open.y, Valve.opening) annotation(
    Line(points = {{156, 131.5}, {156, 121}}, color = {0, 0, 127}));
  connect(s_Cmp_in.port_b, T_Cmp_in.port_a) annotation(
    Line(points = {{60, 86}, {60, 81}}, color = {0, 127, 255}));
  connect(T_Cmp_in.port_b, Cmp.port_b) annotation(
    Line(points = {{60, 75}, {60, 58}}, color = {0, 127, 255}));
  connect(s_Cmp_out.port_a, T_Cmp_out.port_b) annotation(
    Line(points = {{100, 87}, {100, 81}}, color = {0, 127, 255}));
  connect(T_Cmp_out.port_a, Cmp.port_a) annotation(
    Line(points = {{100, 75}, {100, 58}}, color = {0, 127, 255}));
  connect(Vol.ports[1], Valve.port_a) annotation(
    Line(points = {{128, 114}, {146, 114}}, color = {0, 127, 255}));
  connect(p_Cmp_in.port, Cmp.port_b) annotation(
    Line(points = {{54, 65}, {60, 65}, {60, 58}}, color = {0, 127, 255}));
  connect(Vol.ports[2], s_Cmp_out.port_b) annotation(
    Line(points = {{128, 114}, {100, 114}, {100, 93}}, color = {0, 127, 255}));
  connect(p_Cmp_out.port, Cmp.port_a) annotation(
    Line(points = {{108, 65}, {100, 65}, {100, 58}}, color = {0, 127, 255}));
  connect(pwr_Cmp.flange_b, Cmp.shaft_a) annotation(
    Line(points = {{107, 46}, {100, 46}}));
  connect(pwr_Cmp.flange_a, trq_Cmp.flange_b) annotation(
    Line(points = {{113, 46}, {117, 46}}));
  connect(trq_Cmp.flange_a, speed.flange) annotation(
    Line(points = {{123, 46}, {142, 46}}));
  connect(Cmp.partialArc, ramp_partialArc.y) annotation(
    Line(points = {{90, 38}, {90, 18}, {98, 18}}, color = {0, 0, 127}));
  connect(boundary.ports[1], m_flow_Cmp_in.port_a) annotation(
    Line(points = {{36, 112}, {60, 112}, {60, 103}}, color = {0, 127, 255}));
  connect(m_flow_Cmp_in.port_b, s_Cmp_in.port_a) annotation(
    Line(points = {{60, 97}, {60, 92}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "4.1.0"), TRANSFORM(version = "1.0")),
  Diagram(coordinateSystem(extent = {{0, 160}, {220, 0}})),
  version = "",
  experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.1),
  __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end TurbineAsCompressor_ex01;