within WalkingInWorldOfThermoFluid.Normal;

model ExpansionValve_steam_002
  extends Modelica.Icons.Example;
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 101 + 273.15, nPorts = 1, p = 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve1(redeclare package Medium = Modelica.Media.Water.StandardWater, dp_nominal = 3 * 101.325 * 1000, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valve(duration = 10, height = -0.5, offset = 1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system(T_ambient = 299.15)  annotation(
    Placement(visible = true, transformation(origin = {-10, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 150 + 273.15, m_flow = 1, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_valve.y, valve1.opening) annotation(
    Line(points = {{11, 40}, {20, 40}, {20, 18}}, color = {0, 0, 127}));
  connect(valve1.port_b, boundary1.ports[1]) annotation(
    Line(points = {{30, 10}, {60, 10}}, color = {0, 127, 255}));
  connect(boundary.ports[1], valve1.port_a) annotation(
    Line(points = {{-60, 10}, {10, 10}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06));
end ExpansionValve_steam_002;
