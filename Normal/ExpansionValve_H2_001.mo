within WalkingInWorldOfThermoFluid.Normal;

model ExpansionValve_H2_001
  extends Modelica.Icons.Example;
  Modelica.Fluid.Sources.Boundary_pT boundary_H2(redeclare package Medium = Modelica.Media.IdealGases.SingleGases.H2, T = 150 + 273.15, nPorts = 1, p = 2 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1_H2(redeclare package Medium = Modelica.Media.IdealGases.SingleGases.H2, T = 101 + 273.15, nPorts = 1, p = 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve_H2(redeclare package Medium = Modelica.Media.IdealGases.SingleGases.H2, dp_nominal = 3 * 101.325 * 1000, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valve(duration = 10, height = 0, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system(T_ambient = 299.15)  annotation(
    Placement(visible = true, transformation(origin = {-10, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 200 * 1000, offset = 200 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve_air(redeclare package Medium= Modelica.Media.Air.DryAirNasa, dp_nominal = 3 * 101.325 * 1000, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1_air(redeclare package Medium= Modelica.Media.Air.DryAirNasa, T = 101 + 273.15, nPorts = 1, p = 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {70, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary_air(redeclare package Medium= Modelica.Media.Air.DryAirNasa, T = 150 + 273.15, nPorts = 1, p = 2 * 100 * 1000, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_valve.y, valve_H2.opening) annotation(
    Line(points = {{1, 40}, {20, 40}, {20, 18}}, color = {0, 0, 127}));
  connect(boundary_H2.ports[1], valve_H2.port_a) annotation(
    Line(points = {{-30, 10}, {10, 10}}, color = {0, 127, 255}));
  connect(valve_H2.port_b, boundary1_H2.ports[1]) annotation(
    Line(points = {{30, 10}, {60, 10}}, color = {0, 127, 255}));
  connect(ramp_p_in.y, boundary_H2.p_in) annotation(
    Line(points = {{-68, 40}, {-62, 40}, {-62, 18}, {-52, 18}}, color = {0, 0, 127}));
  connect(ramp_valve.y, valve_air.opening) annotation(
    Line(points = {{2, 40}, {6, 40}, {6, -16}, {20, -16}, {20, -32}}, color = {0, 0, 127}));
  connect(boundary_air.ports[1], valve_air.port_a) annotation(
    Line(points = {{-30, -40}, {10, -40}}, color = {0, 127, 255}));
  connect(valve_air.port_b, boundary1_air.ports[1]) annotation(
    Line(points = {{30, -40}, {60, -40}}, color = {0, 127, 255}));
  connect(ramp_p_in.y, boundary_air.p_in) annotation(
    Line(points = {{-68, 40}, {-62, 40}, {-62, -32}, {-52, -32}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06));
end ExpansionValve_H2_001;
