within WalkingInWorldOfThermoFluid.Normal;

model ExpansionValve_R134_001
  extends Modelica.Icons.Example;
  Modelica.Fluid.Sources.Boundary_pT boundary1_R134(redeclare package Medium = Modelica.Media.R134a.R134a_ph, T = 15 + 273.15, nPorts = 1, p = 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve_R134(redeclare package Medium = Modelica.Media.R134a.R134a_ph, dp_nominal = 2 * 101.325 * 1000, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valve(duration = 10, height = 0, offset = 1, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-24, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system(T_ambient = 299.15)  annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary_R134(redeclare package Medium = Modelica.Media.R134a.R134a_ph, T = 26 + 273.15,nPorts = 1, p = 3 * 100 * 1000, use_T_in = true, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_in(duration = 10, height = 200 * 1000, offset = 200 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary_air(redeclare package Medium= Modelica.Media.Air.DryAirNasa, T = 26 + 273.15, nPorts = 1, p = 3 * 100 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve_air(redeclare package Medium= Modelica.Media.Air.DryAirNasa,dp_nominal = 2 * 101.325 * 1000, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1_air(redeclare package Medium= Modelica.Media.Air.DryAirNasa,T = 15 + 273.15, nPorts = 1, p = 100 * 1000) annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_in(duration = 10, height = 0, offset = 26 + 273.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_valve.y, valve_R134.opening) annotation(
    Line(points = {{-13, 40}, {10, 40}, {10, 18}}, color = {0, 0, 127}));
  connect(valve_R134.port_b, boundary1_R134.ports[1]) annotation(
    Line(points = {{20, 10}, {80, 10}}, color = {0, 127, 255}));
  connect(boundary_R134.ports[1], valve_R134.port_a) annotation(
    Line(points = {{-40, 10}, {0, 10}}, color = {0, 127, 255}));
  connect(ramp_p_in.y, boundary_R134.p_in) annotation(
    Line(points = {{-78, 40}, {-68, 40}, {-68, 18}, {-62, 18}}, color = {0, 0, 127}));
  connect(boundary_air.ports[1], valve_air.port_a) annotation(
    Line(points = {{-40, -30}, {0, -30}}, color = {0, 127, 255}));
  connect(valve_air.port_b, boundary1_air.ports[1]) annotation(
    Line(points = {{20, -30}, {80, -30}}, color = {0, 127, 255}));
  connect(ramp_valve.y, valve_air.opening) annotation(
    Line(points = {{-12, 40}, {-6, 40}, {-6, -14}, {10, -14}, {10, -22}}, color = {0, 0, 127}));
  connect(ramp_p_in.y, boundary_air.p_in) annotation(
    Line(points = {{-78, 40}, {-74, 40}, {-74, -22}, {-62, -22}}, color = {0, 0, 127}));
  connect(ramp_T_in.y, boundary_R134.T_in) annotation(
    Line(points = {{-78, 10}, {-68, 10}, {-68, 14}, {-62, 14}}, color = {0, 0, 127}));
  connect(ramp_T_in.y, boundary_air.T_in) annotation(
    Line(points = {{-78, 10}, {-70, 10}, {-70, -26}, {-62, -26}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06));
end ExpansionValve_R134_001;
