within WalkingInWorldOfThermoFluid.Normal;

model ExpansionValve_R134_001
  extends Modelica.Icons.Example;
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.R134a.R134a_ph, T = 15 + 273.15, nPorts = 1, p = 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve1(redeclare package Medium = Modelica.Media.R134a.R134a_ph, dp_nominal = 2 * 101.325 * 1000, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valve(duration = 10, height = 0, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system(T_ambient = 299.15)  annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.R134a.R134a_ph, T = 26 + 273.15,nPorts = 1, p = 3 * 100 * 1000, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 200 * 1000, offset = 200 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_valve.y, valve1.opening) annotation(
    Line(points = {{1, 40}, {10, 40}, {10, 18}}, color = {0, 0, 127}));
  connect(valve1.port_b, boundary1.ports[1]) annotation(
    Line(points = {{20, 10}, {80, 10}}, color = {0, 127, 255}));
  connect(boundary.ports[1], valve1.port_a) annotation(
    Line(points = {{-40, 10}, {0, 10}}, color = {0, 127, 255}));
  connect(ramp_p_in.y, boundary.p_in) annotation(
    Line(points = {{-78, 40}, {-68, 40}, {-68, 18}, {-62, 18}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06));
end ExpansionValve_R134_001;
