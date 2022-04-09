within WalkingInWorldOfThermoFluid.Normal;

model ExpansionValve_R134_002
  extends Modelica.Icons.Example;
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.R134a.R134a_ph, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve1(redeclare package Medium = Modelica.Media.R134a.R134a_ph, dp_nominal = 2 * 101.325 * 1000, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 10, height = -0.1, offset = 1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system(T_ambient = 299.15)  annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = Modelica.Media.R134a.R134a_ph, T = 26 + 273.15, m_flow = 1, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {-80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp.y, valve1.opening) annotation(
    Line(points = {{-19, 40}, {-11, 40}, {-11, 18}}, color = {0, 0, 127}));
  connect(valve1.port_b, boundary1.ports[1]) annotation(
    Line(points = {{0, 10}, {80, 10}}, color = {0, 127, 255}));
  connect(boundary.ports[1], valve1.port_a) annotation(
    Line(points = {{-70, 10}, {-20, 10}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06));
end ExpansionValve_R134_002;
